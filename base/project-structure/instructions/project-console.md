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
├── Services/
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

### Services

The `Services` directory contains dependency-injected classes that provide a specific, clearly defined set of functionality to the application.

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
