# Database conventions

These instructions define the standard database technology, configuration, context lifetime, migration, and seeding behavior for projects that use the AI Brain.

## Database technology

**Required:** Use SQLite as the default database technology unless the user or established project requirements specify another provider. The standard persistence model is a local SQLite database file rather than a remote database service.

Keep database implementation in the Infrastructure project. Domain models, API contracts, UI state, and persistence entities remain separate representations even when their fields currently resemble one another.

## SQLite database location

The SQLite database file normally exists outside the application's source directories. Configure its filesystem location in the executable host's `appsettings.json`. Store a database path, not a complete SQLite connection string; Infrastructure constructs the provider connection string after resolving and validating the path.

Use configuration shaped like this unless the project has an established configuration contract:

```json
{
  "Database": {
    "Path": "C:\\Data\\PROJECT_NAME\\PROJECT_NAME.db"
  }
}
```

`DatabasePath.cs` resolves the configured value using these rules:

1. When the configured path is absolute, normalize and use that path.
2. When the configured path is relative, resolve it against the executable application's base directory, represented by `AppContext.BaseDirectory`.
3. When the value is absent, empty, or whitespace, use a project-specific default filename such as `PROJECT_NAME.db` in `AppContext.BaseDirectory`.
4. Validate the resolved path before configuring SQLite. Reject invalid paths and ensure the parent directory exists or can be created before database initialization.

Use the application base directory instead of the process working directory so relative and default paths behave consistently after deployment. A project-specific requirement may select another stable base directory.

Keep `appsettings.json` in the executable host that owns startup, such as the API, Desktop, or Console project. Do not add an `appsettings.json` file to the Infrastructure class library solely to hold the database path.

## Context and entity sets

`Context.cs` derives from Entity Framework Core's `DbContext`, configures the persistence model, and exposes a `DbSet<TEntity>` for each entity stored by the application.

```csharp
public DbSet<ExampleEntity> ExampleEntities { get; set; }
```

Include only entity sets used by the application. Keep entity configuration and provider-specific persistence behavior in the context or the established Entity Framework configuration layer.

## Context factories and handler lifetime

**Required:** Register `IDbContextFactory<Context>` in `DependencyInjection.cs`. Handlers that access the database inject the factory rather than a long-lived `Context` instance. Each handler operation creates and asynchronously disposes its own context:

```csharp
public sealed class GetExamplesHandler(IDbContextFactory<Context> contextFactory)
{
    private readonly IDbContextFactory<Context> _contextFactory = contextFactory;

    private async Task<IReadOnlyList<ExampleEntity>> GetExamples(
        CancellationToken cancellationToken)
    {
        await using var database = await _contextFactory.CreateDbContextAsync(
            cancellationToken);

        return await database.ExampleEntities
            .AsNoTracking()
            .ToListAsync(cancellationToken);
    }
}
```

Create the context as close as practical to the operation that owns it. Pass the cancellation token to context creation and every asynchronous Entity Framework operation. Do not share one context between handlers, retain it beyond the operation, or use one context concurrently.

`ContextFactory.cs` provides design-time context creation for Entity Framework tooling, normally by implementing `IDesignTimeDbContextFactory<Context>`. Runtime handlers use the registered `IDbContextFactory<Context>` instead of directly instantiating or injecting this design-time factory.

Neither factory support nor path resolution may be dead scaffolding:

- `DependencyInjection.cs` must call `DatabasePath.cs` when it configures the runtime factory and SQLite provider.
- `ContextFactory.cs` must use the same path-resolution and provider configuration when it creates a design-time context.
- Handlers that perform database work must create their context through the registered runtime factory.
- Do not add `ContextFactory.cs` or `DatabasePath.cs` and then bypass them with unrelated inline path or context construction.

## Migrations and seeding

`DatabaseMigration.cs` creates the SQLite database when necessary and applies pending schema migrations so required tables and columns exist. Run migration during application startup before code depends on the schema.

`SeedingData.cs` adds only the minimum baseline data required for the application to start or function correctly. Run seeding after migration. Seeding must check for existing data and remain idempotent rather than inserting duplicates on every execution.

Expose startup initialization through Infrastructure dependency-injection extensions. The executable host calls Infrastructure registration and then initialization from its composition root.

## Startup database connection test

**Required:** Every application that contains and uses an Infrastructure database must test the database connection exactly once during startup. This requirement applies to API, Desktop, and Console hosts.

Add `DatabaseConnection.cs` under the Infrastructure project's `Database` directory. `DatabaseConnection` injects `IDbContextFactory<Context>` and `ILogger<DatabaseConnection>`. Its `TestConnectionAsync` method creates and asynchronously disposes its own context, calls `database.Database.CanConnectAsync(cancellationToken)`, and returns a `DatabaseConnectionResult` containing:

- `IsSuccess`, indicating whether the connection succeeded; and
- `Message`, containing a safe description suitable for startup diagnostics.

Use this shape:

```csharp
public sealed record DatabaseConnectionResult(bool IsSuccess, string Message);

public sealed class DatabaseConnection(
    IDbContextFactory<Context> contextFactory,
    ILogger<DatabaseConnection> logger)
{
    private readonly IDbContextFactory<Context> _contextFactory = contextFactory;
    private readonly ILogger<DatabaseConnection> _logger = logger;

    public async Task<DatabaseConnectionResult> TestConnectionAsync(
        CancellationToken cancellationToken)
    {
        try
        {
            await using var database = await _contextFactory.CreateDbContextAsync(
                cancellationToken);

            var canConnect = await database.Database.CanConnectAsync(cancellationToken);
            return canConnect
                ? new(true, "Connected to the database.")
                : new(false, "Cannot connect to the database.");
        }
        catch (OperationCanceledException)
        {
            throw;
        }
        catch (Exception exception)
        {
            _logger.LogError(exception, "The database connection test failed.");
            return new(false, "Cannot connect to the database.");
        }
    }
}
```

Register `DatabaseConnection` with the other database services in `DependencyInjection.cs`. Also define an asynchronous startup extension there that resolves `DatabaseConnection`, calls `TestConnectionAsync`, and throws `InvalidOperationException` with the returned message when `IsSuccess` is `false`.

```csharp
public static async Task TestConnectionAsync(
    this IServiceProvider services,
    CancellationToken cancellationToken)
{
    await using var scope = services.CreateAsyncScope();
    var connection = scope.ServiceProvider
        .GetRequiredService<DatabaseConnection>();
    var result = await connection.TestConnectionAsync(cancellationToken);

    if (!result.IsSuccess)
    {
        throw new InvalidOperationException(result.Message);
    }
}
```

`AddDatabase` and migration-related methods register or initialize database services. `TestConnectionAsync` is a startup execution step, not another service-registration call: invoke it only after the service provider or host has been built. Run database path resolution, migration, and seeding before the final connection test so the test verifies the initialized database the application will actually use.

```csharp
builder.Services.AddDatabase(builder.Configuration);
builder.Services.AddMigration();

var app = builder.Build();

await app.Services.InitializeDatabaseAsync(cancellationToken);
await app.Services.TestConnectionAsync(cancellationToken);
```

Use the established migration-initialization method name when it differs from `InitializeDatabaseAsync`; the required behavior and ordering are what matter.

Invoke the startup test from the owning host:

- **API:** Call it from `ApiHost.cs` after the host is built and database initialization completes, but before the API begins accepting requests.
- **Desktop:** When Desktop uses the API host, use the same `ApiHost.cs` startup path. Otherwise call it from the Desktop composition root before showing the primary window.
- **Console:** Call it as the first database-dependent operation in `Application.Run` or `Application.RunAsync`, before normal console work begins.

Do not invoke `GetStatusHandler`, send a MediatR query, or call the HTTP `/status` endpoint during startup. The startup test and status handler are deliberately separate: `DatabaseConnection` fails application startup, while `GetStatusHandler` serves request-time status checks after the application is running.

When an application has no database, do not register or invoke `DatabaseConnection` merely to satisfy this convention.

## Packages and provider configuration

The Infrastructure project contains Entity Framework Core, the SQLite provider, design-time tooling, and other persistence packages required by the implementation. Keep package versions consistent with the solution's target framework and central package strategy.

Construct the SQLite connection string from the resolved database path inside Infrastructure. Do not store the constructed connection string in application settings when the configuration contract calls for a database path.

## Verification

Before considering database integration complete:

1. Confirm the host configuration supplies or intentionally omits `Database:Path`.
2. Verify absolute, relative, and empty-path resolution.
3. Confirm runtime registration and design-time creation both use `DatabasePath.cs`.
4. Confirm every database handler creates and disposes a context through `IDbContextFactory<Context>`.
5. Confirm `DatabaseConnection` is registered and its startup extension is invoked exactly once by the executable host.
6. Verify that a failed startup connection result stops the application with `InvalidOperationException` and a safe message.
7. Confirm `GetStatusHandler` remains separate from the startup connection test.
8. Run migration and seeding twice and verify the second run is safe and does not duplicate baseline data.
9. Start the application from a deployment-like directory and confirm the resolved SQLite file location is correct.
