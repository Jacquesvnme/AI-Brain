# API observability conventions

These instructions define the standard logging and request-observability baseline for ASP.NET Core APIs created as part of the React Web API solution layout.

## Applicability

**Required:** Apply these conventions to the API project in the standard React Web API layout defined by `{project-path}\base\project-layout\instructions\react-web-api.md`.

Do not apply this requirement by default to the React Web API with Desktop layout. Add Serilog to that layout only when the user explicitly requests it or project-specific requirements already establish it.

The logging library is named **Serilog**. Use that name in package references, source code, and documentation.

## Required packages

Add these direct package references to `PROJECT_NAME.Api`:

- `Serilog.AspNetCore` provides the ASP.NET Core and hosting integration.
- `Serilog.Sinks.Console` provides console output and must be enabled by default.

Run these commands from the outer solution directory:

```powershell
dotnet add PROJECT_NAME/PROJECT_NAME.Api/PROJECT_NAME.Api.csproj package Serilog.AspNetCore
dotnet add PROJECT_NAME/PROJECT_NAME.Api/PROJECT_NAME.Api.csproj package Serilog.Sinks.Console
```

Choose a `Serilog.AspNetCore` major version compatible with the API project's target framework. Do not add `Serilog.Extensions.Hosting` or `Serilog.Extensions.Logging` as direct references when `Serilog.AspNetCore` already supplies the required integration. Add another Serilog package only when a concrete sink, formatter, or integration requires it.

Record the exact package commands in the project's `Creation.md` according to the required project-file instructions.

## Configuration

Configure Serilog in the API composition root and route ASP.NET Core's `ILogger` events through the same Serilog pipeline. The default configuration must include the console sink through `WriteTo.Console()`.

A standard final-logger configuration has this shape:

```csharp
using Serilog;

builder.Services.AddSerilog((services, loggerConfiguration) => loggerConfiguration
    .ReadFrom.Configuration(builder.Configuration)
    .ReadFrom.Services(services)
    .Enrich.FromLogContext()
    .WriteTo.Console());
```

Keep logging configuration close to API host startup. When the project separates `Program.cs` from `ApiHost.cs`, keep `Program.cs` focused on application startup and place reusable host or service configuration in `ApiHost.cs` or a focused API configuration extension.

Enable Serilog request logging for the HTTP pipeline. Register `UseSerilogRequestLogging()` before controllers or other endpoint handlers whose requests must be measured and logged.

```csharp
app.UseSerilogRequestLogging();
app.MapControllers();
```

Ensure startup failures are logged and the logger is flushed during shutdown. Remove or reconcile duplicate default logging configuration so the same event is not emitted through competing providers.

## Logging behavior

Use structured message templates and named properties rather than interpolating values into log strings. Log enough context to diagnose startup, request, dependency, and unexpected application failures without exposing secrets or private data.

Do not log:

- credentials, tokens, API keys, or connection secrets;
- request or response bodies containing sensitive user data;
- raw database details or private filesystem paths in client-facing messages; or
- routine successful operations at unnecessarily noisy levels.

Use the injected `ILogger<T>` abstraction in application code unless direct Serilog APIs are required for host bootstrap or a Serilog-specific feature. Console logging is the required baseline; additional sinks are project-specific and require a concrete need.

## Verification

Before considering the setup complete:

1. Confirm both required packages are direct references of `PROJECT_NAME.Api`.
2. Start the API and verify that startup events appear in the console.
3. Send a representative request and verify that one structured request-completion event is written.
4. Confirm an expected handled failure does not expose sensitive implementation details.
5. Confirm shutdown flushes pending log events.
