# Infrastructure project

The Infrastructure project is a C# class library for database-related code and other persistence concerns. Keep database contexts, migrations, repository implementations, and data-access configuration in this project rather than in the Domain or application-host projects.

## Naming

`PROJECT_NAME.Infrastructure`

## Creation

Run this command from the outer `PROJECT_NAME` solution directory. The `--output` path places the project inside the inner source directory.

```powershell
dotnet new classlib --name PROJECT_NAME.Infrastructure --output PROJECT_NAME/PROJECT_NAME.Infrastructure --framework net10.0
```

## Expected output

```text
PROJECT_NAME/
└── PROJECT_NAME.Infrastructure/
    └── PROJECT_NAME.Infrastructure.csproj
```

## Expected structure

- **project-infrastructure.md:** `{project-path}\base\project-structure\instructions\project-infrastructure.md`
