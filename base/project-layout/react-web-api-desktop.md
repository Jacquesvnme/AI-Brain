# React Web API with Desktop project layout

## Standard solution layout

Replace `PROJECT_NAME` with the project name for the outer directory, inner source directory, and project directories.

Keep solution-level configuration, documentation, and shared project files in the outer directory. Store the local .NET tool manifest in `.config`, and place each `.csproj` or `.esproj` project in its own directory inside the inner source directory.

The Desktop project is the primary executable and preferred publish target. The API project remains available as the fallback publish target.

```text
PROJECT_NAME/
├── .codegraph/
├── .config/
│   └── dotnet-tools.json
├── .git/
├── PROJECT_NAME/
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
├── .csharpierrc.json
├── .editorconfig
├── .gitattributes
├── .gitignore
├── AGENTS.md
├── Creation.md
├── DeleteBins.ps1
├── Directory.Build.props
├── LICENSE
├── Project.slnx
├── ProjectExporter.ps1
└── README.md
```
