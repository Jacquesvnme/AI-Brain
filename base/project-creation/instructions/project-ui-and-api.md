# UI and API projects

The `reactwebapi` template creates the React TypeScript UI and ASP.NET Core Web API together. Use these instructions when the selected project layout includes both projects.

The `reactwebapi` template must be installed before running the creation command.

## Naming

The generated projects must use these final names:

- `PROJECT_NAME.UI`
- `PROJECT_NAME.Api`

The template initially creates `PROJECT_NAME.client` and `PROJECT_NAME.Server`. Rename those generated project directories after creation. If their `.esproj` or `.csproj` filenames retain the generated names, rename those files as well and update any project or configuration references that contain the previous names.

## Creation

Run these commands from the outer `PROJECT_NAME` solution directory. Create the UI and API before the other component projects so the combined template establishes the inner source directory first.

```powershell
dotnet new reactwebapi --language typescript --output PROJECT_NAME --framework net10.0
Set-Location PROJECT_NAME
Rename-Item "PROJECT_NAME.client" "PROJECT_NAME.UI"
Rename-Item "PROJECT_NAME.Server" "PROJECT_NAME.Api"
Set-Location ..
```

The final `Set-Location ..` returns PowerShell to the outer solution directory before any other creation commands are run.

## Expected output

After applying any required renaming, the generated projects must match this structure:

```text
PROJECT_NAME/
├── PROJECT_NAME.Api/
│   └── PROJECT_NAME.Api.csproj
└── PROJECT_NAME.UI/
    └── PROJECT_NAME.UI.esproj
```
