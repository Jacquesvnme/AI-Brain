# SLNX solution

The `.slnx` file is the solution container for all component projects. It belongs in the outer `PROJECT_NAME` solution directory, next to the shared solution-level files, and not inside the inner source directory.

## Naming

`PROJECT_NAME.slnx`

## Creation

Run this command from the outer `PROJECT_NAME` solution directory. The explicit format option ensures that the .NET CLI creates an XML `.slnx` file rather than a legacy `.sln` file.

```powershell
dotnet new sln --name PROJECT_NAME --format slnx
```

## Expected output

```text
PROJECT_NAME/
├── PROJECT_NAME.slnx
└── PROJECT_NAME/
```

The solution is initially empty. Add each `.csproj` and `.esproj` project after all required component projects have been created and renamed.
