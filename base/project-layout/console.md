# Console project layout

## Standard solution layout

Replace `PROJECT_NAME` with the project name for the outer directory, inner source directory, and project directories.

Keep solution-level configuration, documentation, and shared project files in the outer directory. Store the local .NET tool manifest in `.config`, and place each `.csproj` project in its own directory inside the inner source directory.

The Console project is the primary executable. This layout does not include API, Desktop, or UI projects.

```text
PROJECT_NAME/
├── .codegraph/
├── .config/
│   └── dotnet-tools.json
├── .git/
├── PROJECT_NAME/
    ├── PROJECT_NAME.Console/
    │   └── PROJECT_NAME.Console.csproj
    ├── PROJECT_NAME.Domain/
    │   └── PROJECT_NAME.Domain.csproj
    └── PROJECT_NAME.Test/
        └── PROJECT_NAME.Test.csproj
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
└── README.md
```
