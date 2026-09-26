# React Web API with Desktop project layout

## Standard solution layout

Use the same project name for the outer directory and its inner source directory.

Keep the solution file and shared project scripts in the outer directory. Inside the inner directory, place each `.csproj` or `.esproj` project in its own directory.

The Desktop project is the primary executable and preferred publish target. The API project remains available as the fallback publish target.

```text
PROJECT_NAME/
├── PROJECT_NAME.slnx
├── DeleteBins.ps1
├── ProjectExporter.ps1
└── PROJECT_NAME/
    ├── PROJECT_NAME.Api/
    │   └── PROJECT_NAME.Api.csproj
    ├── PROJECT_NAME.Desktop/
    │   └── PROJECT_NAME.Desktop.csproj
    ├── PROJECT_NAME.Domain/
    │   └── PROJECT_NAME.Domain.csproj
    ├── PROJECT_NAME.Test/
    │   └── PROJECT_NAME.Test.csproj
    └── PROJECT_NAME.UI/
        └── PROJECT_NAME.UI.esproj
```
