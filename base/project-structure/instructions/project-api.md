# API Project

The API project is the ASP.NET Core host for HTTP endpoints and API-specific application behavior. Its standard structure groups endpoints into controllers and organizes their corresponding handlers by the same feature or resource.

Replace `PROJECT_NAME` with the actual project name throughout the structure.

## Expected structure

```text
PROJECT_NAME.Api/
├── Controllers/
│   ├── FeatureController.cs
│   └── StatusController.cs
├── DependencyInjection/
│   └── DependencyInjection.cs
├── Handlers/
│   ├── Feature/
│   │   └── ActionFeatureHandler.cs
│   └── Status/
│       └── GetStatusHandler.cs
├── Validators/
│   └── Feature/
│       └── ActionFeatureValidator.cs
├── Properties/
│   └── launchSettings.json
├── Utils/
├── ApiHost.cs
├── Program.cs
├── appsettings.json
├── appsettings.Development.json
└── PROJECT_NAME.Api.csproj
```

Only include files and directories that are required by the application and its configured environments.

## Directory responsibilities

### Controllers

The `Controllers` directory contains the API controllers. Organize controllers by the feature or resource they expose and name each controller with the `Controller` suffix, such as `ModsController.cs`.

Each controller should have a corresponding feature directory under `Handlers` when it uses handlers. For example, handlers used by `ModsController.cs` belong in `Handlers/Mods`.

Every API includes `StatusController.cs` and its unauthenticated `GET /status` endpoint. Its handler belongs at `Handlers/Status/GetStatusHandler.cs`. Apply the endpoint contract in `{project-path}\base\project-conventions\instructions\api\controllers.md`.

### Handlers

The `Handlers` directory contains API operation handlers, grouped into directories that correspond to their controller or feature. A handler represents a specific operation or piece of functionality.

Name handlers by combining the operation, the subject, and the `Handler` suffix. For example, the handler that adds a mod is named `AddModHandler.cs`.

The `Handlers` directory and this naming convention are specific to the API project's application handlers. Other projects should not introduce an equivalent handler structure unless their own project-structure instructions define one.

When a handler accesses the database, it creates its own context through the registered context factory according to `{project-path}\base\project-conventions\instructions\infrastructure\database.md`.

### Validators

The `Validators` directory contains reusable or non-trivial validation for API input. Group validators by the same controller, feature, or resource used under `Handlers`. For example, validation for mod operations belongs in `Validators/Mods`.

Name a validator for the operation or request it validates and add the `Validator` suffix, such as `AddModValidator.cs` or `AddModRequestValidator.cs`. Use one naming approach consistently within the project.

Controllers run transport validation before sending a query or command. Validators check request shape, required values, ranges, formats, and relationships among input fields. Database state, authorization decisions, and business invariants remain handler or domain responsibilities unless the project deliberately defines another validation boundary.

Only add the directory when the API has validation that benefits from extraction. Small checks may remain in a controller when a separate type would obscure the endpoint flow.

### DependencyInjection

The `DependencyInjection` directory contains `DependencyInjection.cs`. Use it to register MediatR handlers and other API-specific dependencies or extensions.

### Utils

The `Utils` directory contains small API-specific utilities that do not belong to a controller, handler, or another project. Group or split utilities further when needed to keep their responsibilities clear.

### Properties

The `Properties` directory contains generated or environment-specific launch configuration such as `launchSettings.json`.

## Root files

### ApiHost.cs

`ApiHost.cs` composes and configures the web application. It configures services, middleware, endpoints, API documentation, authorization, and other host-level behavior required before the API can run.

When the solution contains an Infrastructure database, `ApiHost.cs` runs the Infrastructure migration and seeding initialization and then invokes its one-time `TestConnectionAsync` startup extension before accepting requests. Do not route this startup check through `GetStatusHandler`; that handler remains dedicated to `GET /status`.

### Program.cs

`Program.cs` is the executable entry point. Keep it focused on starting the API host rather than placing application behavior directly in it.

### Application settings

`appsettings.json` contains the default application configuration. Environment-specific files such as `appsettings.Development.json` override those defaults for their applicable environments.
