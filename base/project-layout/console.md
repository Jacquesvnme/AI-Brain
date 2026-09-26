# Console project layout

## Standard solution layout

Use the same project name for the outer directory and its inner source directory.

Keep the solution file and shared project scripts in the outer directory. Inside the inner directory, place each `.csproj` project in its own directory.

The Console project is the primary executable. This layout does not include API, Desktop, or UI projects.

```text
PROJECT_NAME/
├── PROJECT_NAME.slnx
├── DeleteBins.ps1
└── PROJECT_NAME/
    ├── PROJECT_NAME.Console/
    │   └── PROJECT_NAME.Console.csproj
    ├── PROJECT_NAME.Domain/
    │   └── PROJECT_NAME.Domain.csproj
    └── PROJECT_NAME.Test/
        └── PROJECT_NAME.Test.csproj
```
