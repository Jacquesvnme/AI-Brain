# Domain project

The Domain project is a C# class library for the solution's domain models, business rules, and other code that does not belong to a user-interface or application-host project.

## Naming

`PROJECT_NAME.Domain`

## Creation

Run this command from the outer `PROJECT_NAME` solution directory. The `--output` path places the project inside the inner source directory.

```powershell
dotnet new classlib --name PROJECT_NAME.Domain --output PROJECT_NAME/PROJECT_NAME.Domain --framework net10.0
```

## Expected output

```text
PROJECT_NAME/
└── PROJECT_NAME.Domain/
    └── PROJECT_NAME.Domain.csproj
```
