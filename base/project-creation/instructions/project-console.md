# Console project

The Console project is the primary executable for a Console solution. Use these instructions for the Console layout instead of creating the React UI and Web API projects.

## Naming

`PROJECT_NAME.Console`

## Creation

Run this command from the outer `PROJECT_NAME` solution directory. The `--output` path places the project inside the inner source directory.

```powershell
dotnet new console --name PROJECT_NAME.Console --output PROJECT_NAME/PROJECT_NAME.Console --framework net10.0
```

## Expected output

```text
PROJECT_NAME/
└── PROJECT_NAME.Console/
    └── PROJECT_NAME.Console.csproj
```
