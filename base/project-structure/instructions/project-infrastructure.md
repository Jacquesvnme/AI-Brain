# Infrastructure Project

The Infrastructure project contains database-related implementation, including database setup, persistence entities, migration, seeding, and dependency registration. Its standard structure is organized around those database responsibilities.

Use SQLite as the default database technology unless the user or established project requirements specify another provider. The standard persistence model is a local SQLite database file rather than a remote database service.

Replace `PROJECT_NAME` with the actual project name throughout the structure.

## Expected structure

```text
PROJECT_NAME.Infrastructure/
├── Database/
│   ├── Context.cs
│   ├── ContextFactory.cs
│   └── DatabasePath.cs
├── Entities/
│   └── ExampleEntity.cs
├── Migrations/
│   └── DatabaseMigration.cs
├── Seeding/
│   └── SeedingData.cs
├── DependencyInjection.cs
├── EntityBase.cs
└── PROJECT_NAME.Infrastructure.csproj
```

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

Use the application base directory instead of the process working directory so that relative and default paths behave consistently after deployment. A project-specific requirement may select another stable base directory.

Keep `appsettings.json` in the executable host that owns startup, such as the API, Desktop, or Console project. Do not add an `appsettings.json` file to the Infrastructure class library solely to hold the database path.

## Directory responsibilities

### Database

The `Database` directory contains the foundational classes required to configure and create access to the database.

- `Context.cs` derives from Entity Framework Core's `DbContext`, configures the persistence model, and exposes a `DbSet<TEntity>` for each entity stored by the application.
- `ContextFactory.cs` creates context instances for design-time tooling, normally through `IDesignTimeDbContextFactory<Context>`. When runtime code requires independently created contexts, register and consume `IDbContextFactory<Context>` through dependency injection instead of treating the design-time factory as a runtime service.
- `DatabasePath.cs` reads, resolves, normalizes, and validates the configured SQLite database path according to the location rules above.

A typical context contains entity sets shaped like this:

```csharp
public DbSet<ExampleEntity> ExampleEntities { get; set; }
```

Include only entity sets used by the application. Keep entity configuration and provider-specific persistence behavior in the context or the established Entity Framework configuration layer.

Adapt these files when the selected database technology requires different setup, while retaining the responsibility of the directory.

### Entities

The `Entities` directory contains persistence entities representing the records stored in the database. Name each entity with the `Entity` suffix, such as `ModEntity.cs`.

Entities may inherit `EntityBase` when they require the shared database fields defined by that base type.

### Migrations

The `Migrations` directory contains database migration behavior. `DatabaseMigration.cs` is responsible for creating the SQLite database when necessary and applying pending schema migrations so that required tables and columns exist.

Run migration during application startup before code depends on the database schema. Migration details may vary with the selected database technology, but database creation and schema-update behavior remain Infrastructure responsibilities.

### Seeding

The `Seeding` directory contains baseline data population. `SeedingData.cs` checks whether the relevant data is absent before inserting the required initial values.

Keep seeding minimal and limited to baseline data required for the application to start or function correctly. Run it after migration has established the current schema.

Seeding is conditional and idempotent initialization behavior. Do not treat it as data that must be inserted again on every execution.

## Root files

### DependencyInjection.cs

`DependencyInjection.cs` registers the resolved database path, configures the context with the SQLite provider, and registers migration, seeding, context-factory, and other Infrastructure dependencies. Construct the SQLite connection string from the resolved path in Infrastructure rather than storing the connection string in application settings.

Expose the startup initialization needed to run migration followed by seeding. The consuming executable host—such as the API, Desktop, or Console project—calls the Infrastructure registration and initialization from its composition root during application startup.

### EntityBase.cs

`EntityBase.cs` contains database-specific fields and behavior shared by persistence entities. It belongs in Infrastructure because its responsibility is tied directly to database entities, even when it resembles a reusable value object.

## Project file

`PROJECT_NAME.Infrastructure.csproj` contains Entity Framework Core, the SQLite provider, design-time tooling, and any other persistence package references required by the implementation. Keep package versions consistent with the solution's target framework and central package strategy.

Do not add executable startup behavior to this class-library project. The executable host owns configuration loading and invokes the Infrastructure registration, migration, and seeding behavior.
