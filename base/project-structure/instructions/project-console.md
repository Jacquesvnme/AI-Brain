# Console Project

The Console project separates its executable entry point, dependency registration, and application behavior. Its remaining internal structure depends on the purpose and complexity of the console application.

Replace `PROJECT_NAME` with the actual project name throughout the structure.

## Expected structure

```text
PROJECT_NAME.Console/
├── Application/
│   └── Application.cs
├── Data/
├── Extensions/
├── Handlers/
│   └── Feature/
│       └── ActionFeatureHandler.cs
├── Validators/
│   └── Feature/
│       └── ActionFeatureValidator.cs
├── Services/
├── Properties/
│   └── launchSettings.json
├── Utils/
├── DependencyInjection.cs
├── Program.cs
├── appsettings.json
└── PROJECT_NAME.Console.csproj
```

Add further directories only when they provide a logical organization for the console application's responsibilities.

## Directory responsibilities

### Application

The `Application` directory contains `Application.cs` and any other functionality required to coordinate the console application.

`Application.cs` contains the primary execution flow and exposes the `Run` method. Place application coordination in this class rather than in `Program.cs`.

### Data

The `Data` directory contains data files used by the console application, including text files and other application-specific data formats.

### Extensions

The `Extensions` directory contains static extension methods that extend the console application's foundational functionality.

### Handlers

The `Handlers` directory contains console application operation handlers, grouped by feature or responsibility. A handler represents a specific operation or piece of functionality coordinated by the console application.

Name handlers by combining the operation, the subject, and the `Handler` suffix, such as `ImportModsHandler.cs`. Keep related handlers together in a feature directory such as `Handlers/Mods`.

### Validators

The `Validators` directory contains reusable or non-trivial validation for console input, command options, configuration values, or operation requests. Group validators by the same feature or responsibility used under `Handlers`.

Name a validator for the operation or input it validates and add the `Validator` suffix, such as `ImportModsValidator.cs` or `ImportModsRequestValidator.cs`. Use one naming approach consistently within the project.

Validators check input shape, required values, ranges, formats, and relationships among supplied values. Database state, authorization decisions, and business invariants remain handler or domain responsibilities unless the project deliberately defines another validation boundary.

Only add the directory when validation benefits from extraction. Small checks may remain near the console input flow when a separate type would make the operation harder to follow.

### Services

The `Services` directory contains dependency-injected classes that provide a specific, clearly defined set of functionality to the application.

### Properties

The `Properties` directory contains generated or environment-specific launch configuration such as `launchSettings.json`.

### Utils

The `Utils` directory contains small Console-specific utilities that do not belong to the application coordinator, a handler, a validator, a service, or another project. Group or split utilities further when needed to keep their responsibilities clear.

## Root files

### DependencyInjection.cs

`DependencyInjection.cs` contains the Console project's dependency registrations and the setup required to construct or resolve the application and its dependencies, including services from the `Services` directory.

### Program.cs

`Program.cs` is the executable entry point. It must remain small and stable: it calls the dependency-injection setup, obtains the configured `Application`, and calls `Application.Run`.

Do not place business or feature behavior in `Program.cs`. Adding or changing console functionality should normally affect `Application.cs`, its dependencies, or supporting files without requiring major changes to `Program.cs`.

### appsettings.json

`appsettings.json` contains the Console project's application configuration and belongs in the root of the Console project directory.

## Documentation

Public Console application types, records, services, configuration models, and public data members follow the shared comment and documentation conventions. `Application.Run` and private helper methods do not need XML documentation when their names and signatures make the behavior clear. Document non-obvious sequencing, side effects, configuration requirements, and failure behavior.
