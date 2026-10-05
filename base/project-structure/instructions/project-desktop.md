# Desktop Project

No fixed internal structure has been defined for the Desktop project. Organize forms, controls, application behavior, and supporting files in a way that is logical for the Windows Forms application being created.

Preserve the generated `Program.cs` entry point and `PROJECT_NAME.Desktop.csproj`. Introduce additional directories only when they make the responsibilities of the desktop application easier to understand and maintain.

## Database startup

When the solution contains an Infrastructure database and Desktop uses the API host, run the one-time Infrastructure `TestConnectionAsync` startup extension through `ApiHost.cs` after database initialization and before the application accepts work. When Desktop initializes Infrastructure directly, invoke the same startup extension from the Desktop composition root before showing the primary window.

Do not send `GetStatusQuery` or call the `/status` endpoint during Desktop startup. The status handler remains a request-time API concern.
