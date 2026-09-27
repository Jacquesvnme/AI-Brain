# React Web API project layout

## Standard solution layout

Replace `PROJECT_NAME` with the project name for the outer directory, inner source directory, and project directories.

Keep solution-level configuration, documentation, and shared project files in the outer directory. Store the local .NET tool manifest in `.config`, and place each `.csproj` or `.esproj` project in its own directory inside the inner source directory.

The API project is the primary executable and publish target.

```text
PROJECT_NAME/
├── .codegraph/
├── .config/
│   └── dotnet-tools.json
├── .git/
├── PROJECT_NAME/
    ├── PROJECT_NAME.Api/
    │   └── PROJECT_NAME.Api.csproj
    ├── PROJECT_NAME.Domain/
    │   └── PROJECT_NAME.Domain.csproj
    ├── PROJECT_NAME.Infrastructure/
    │   └── PROJECT_NAME.Infrastructure.csproj
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

## Project creation instructions

Read and apply each of these project creation instruction files for this layout:

- **project-slnx.md:** `{project-path}\base\project-creation\instructions\project-slnx.md`
- **project-ui-and-api.md:** `{project-path}\base\project-creation\instructions\project-ui-and-api.md`
- **project-domain.md:** `{project-path}\base\project-creation\instructions\project-domain.md`
- **project-infrastructure.md:** `{project-path}\base\project-creation\instructions\project-infrastructure.md`
- **project-test.md:** `{project-path}\base\project-creation\instructions\project-test.md`

### Automated creation script

Use this script to create a new React Web API solution with its SLNX, UI, API, Domain, Infrastructure, and Test projects, perform the required generated-project renaming, and register all component projects in the solution:

- **create-react-web-api.ps1:** `{project-path}\base\project-creation\scripts\create-react-web-api.ps1`
