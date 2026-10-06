# Host observability conventions

These instructions define the standard application-logging and observability baseline for ASP.NET Core APIs, console applications, and Windows Desktop hosts. They apply to the complete logging lifecycle rather than only to errors.

## Applicability

**Required:** Configure built-in `Microsoft.Extensions.Logging` abstractions with Serilog in every API, Console, and Desktop executable project. Application code uses injected `ILogger<T>` instances; Serilog supplies the logging pipeline.

The logging library is named **Serilog**. Use that name in package references, source code, and documentation.

APIs and Console applications write logs to the process console by default. Desktop applications still use `ILogger<T>` with Serilog, but do not add a console sink. Do not add file, rolling-file, Windows Event Log, or another local sink by default for any host. Local persistence is project-specific and is added only when the user requests it or an established project requirement defines it.

## Required packages

### API

Add these direct package references to `PROJECT_NAME.Api`:

- `Serilog.AspNetCore` provides the ASP.NET Core and hosting integration.
- `Serilog.Sinks.Console` provides the required console output.

```powershell
dotnet add PROJECT_NAME/PROJECT_NAME.Api/PROJECT_NAME.Api.csproj package Serilog.AspNetCore
dotnet add PROJECT_NAME/PROJECT_NAME.Api/PROJECT_NAME.Api.csproj package Serilog.Sinks.Console
```

Choose a `Serilog.AspNetCore` major version compatible with the API project's target framework. Do not add `Serilog.Extensions.Hosting` or `Serilog.Extensions.Logging` as direct references when `Serilog.AspNetCore` already supplies the required integration.

### Console

Add these direct package references to `PROJECT_NAME.Console`:

- `Microsoft.Extensions.Hosting` provides the generic host, dependency injection, configuration, and built-in logging abstractions.
- `Serilog.Extensions.Hosting` routes host and `ILogger<T>` events through Serilog.
- `Serilog.Sinks.Console` provides the required console output.

```powershell
dotnet add PROJECT_NAME/PROJECT_NAME.Console/PROJECT_NAME.Console.csproj package Microsoft.Extensions.Hosting
dotnet add PROJECT_NAME/PROJECT_NAME.Console/PROJECT_NAME.Console.csproj package Serilog.Extensions.Hosting
dotnet add PROJECT_NAME/PROJECT_NAME.Console/PROJECT_NAME.Console.csproj package Serilog.Sinks.Console
```

### Desktop

Add these direct package references to `PROJECT_NAME.Desktop`:

- `Microsoft.Extensions.Hosting` provides the generic host, dependency injection, configuration, and built-in logging abstractions.
- `Serilog.Extensions.Hosting` routes host and `ILogger<T>` events through Serilog.

```powershell
dotnet add PROJECT_NAME/PROJECT_NAME.Desktop/PROJECT_NAME.Desktop.csproj package Microsoft.Extensions.Hosting
dotnet add PROJECT_NAME/PROJECT_NAME.Desktop/PROJECT_NAME.Desktop.csproj package Serilog.Extensions.Hosting
```

Do not add `Serilog.Sinks.Console` to Desktop by default. Leave local sink selection to the user or the project's explicit requirements.

Record the exact package commands in the project's `Creation.md` according to the required project-file instructions. Add another Serilog package only when a concrete sink, formatter, or integration requires it.

## Configuration

Configure Serilog in each executable's composition root and route built-in `ILogger` events through the same pipeline. Keep logging setup at host startup rather than scattering Serilog configuration through application classes.

For an API, the final logger includes the console sink:

```csharp
using Serilog;

builder.Services.AddSerilog((services, loggerConfiguration) => loggerConfiguration
    .ReadFrom.Configuration(builder.Configuration)
    .ReadFrom.Services(services)
    .Enrich.FromLogContext()
    .WriteTo.Console());
```

Console applications use the generic host and the equivalent `UseSerilog` or `AddSerilog` integration with `WriteTo.Console()`. Desktop applications use the same host integration without `WriteTo.Console()` and without an implicit local sink. This leaves the Desktop logging pipeline ready for a user-selected local sink without writing to the console.

For APIs, enable Serilog request logging before controllers or other endpoint handlers whose requests must be measured and logged:

```csharp
app.UseSerilogRequestLogging();
app.MapControllers();
```

Ensure startup failures are logged and the logger is flushed during shutdown. Remove or reconcile duplicate default providers so the same event is not emitted through competing pipelines.

## Logging behavior

Log meaningful application activity at the level that matches its operational importance. This includes host startup and shutdown, request completion, significant application operations, dependency behavior, recoverable warnings, and failures. Avoid turning routine internal steps into noisy events.

- Use `Trace` or `Debug` for detailed diagnostic information that is normally disabled.
- Use `Information` for meaningful lifecycle events and completed operations.
- Use `Warning` for unexpected or degraded conditions from which the application can continue.
- Use `Error` for failed operations and caught unexpected exceptions.
- Use `Critical` only when the process or a required subsystem cannot continue safely.

Use structured message templates and named properties rather than interpolating values into log strings:

```csharp
_logger.LogInformation("Editing user {UserId}", userId);
_logger.LogError(exception, "Unhandled exception occurred.");
```

### Database activity

Database-related operations are a primary observability concern. Route Entity Framework Core and other database-provider logs through the same built-in logging and Serilog pipeline so database activity and failures are visible through their standard logging categories.

At the application boundary, make important data-access requests understandable at a useful level, such as retrieving all users, loading one record, creating an entity, or updating persisted data. Prefer a concise operation-level event over manually logging every internal query step. Additional manual business or diagnostic events may be added by the user when a project needs them; do not invent extensive manual observability by default.

Do not enable sensitive-data logging by default, and do not record entity contents, SQL parameters, credentials, connection strings, or other private database details. Logs should identify the kind and outcome of the operation without exposing the returned data.

When logging an exception, pass the exception object to the logging call so technical details and the stack trace remain in the configured application log. Handler-specific exception boundaries and safe response behavior are defined in `{project-path}\base\project-conventions\instructions\handlers.md` and `{project-path}\base\project-conventions\instructions\errors-and-results.md`.

Do not log:

- credentials, tokens, API keys, or connection secrets;
- request or response bodies containing sensitive user data;
- raw database details or private filesystem paths in client-facing messages; or
- routine successful operations at unnecessarily noisy levels.

Use injected `ILogger<T>` in application code unless direct Serilog APIs are required for host bootstrap or a Serilog-specific feature.

## Verification

Before considering the setup complete:

1. Confirm the host has the required direct package references.
2. Confirm application services and handlers receive `ILogger<T>` through dependency injection.
3. Confirm built-in database-provider events flow through the configured logging pipeline without sensitive-data logging.
4. Verify representative data-access operations are understandable without exposing returned records or private database details.
5. Verify representative informational, warning, and error events use the intended levels and structured properties.
6. Trigger a representative handled exception and verify that technical detail is logged while the returned or displayed message remains safe.
7. For an API, verify startup and one structured request-completion event appear in the console.
8. For a Console application, verify application activity and errors appear in the console.
9. For a Desktop application, confirm no console sink or unrequested local sink was configured.
10. Confirm shutdown flushes pending log events.
