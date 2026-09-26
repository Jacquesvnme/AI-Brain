# Test project

The Test project is the MSTest project used for automated tests. Add the project references required by the solution only after all component projects have been created.

## Naming

`PROJECT_NAME.Test`

## Creation

Run this command from the outer `PROJECT_NAME` solution directory. The `--output` path places the project inside the inner source directory.

```powershell
dotnet new mstest --name PROJECT_NAME.Test --output PROJECT_NAME/PROJECT_NAME.Test --framework net10.0
```

## Expected output

```text
PROJECT_NAME/
└── PROJECT_NAME.Test/
    └── PROJECT_NAME.Test.csproj
```
