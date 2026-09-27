# Test Project

The Test project contains the solution's .NET automated tests. No single directory arrangement is required, but the chosen structure must be logical, consistent, and easy to navigate.

Replace `PROJECT_NAME` with the actual project name throughout the examples.

## Project-based structure

Tests may be grouped by the project they verify:

```text
PROJECT_NAME.Test/
├── Api/
├── Desktop/
├── Domain/
├── Infrastructure/
└── PROJECT_NAME.Test.csproj
```

Add or omit project directories to match the projects and test coverage present in the solution.

## Feature-based structure

Tests may instead be grouped by a feature or functional area:

```text
PROJECT_NAME.Test/
├── Mods/
│   ├── ModControllerTests.cs
│   └── AddModHandlerTests.cs
└── PROJECT_NAME.Test.csproj
```

Feature directories may contain tests for multiple projects when keeping the related behavior together makes the suite easier to understand.

Choose the organization that best matches the application. Apply it consistently, keep related tests together, and name test files after the behavior or production type they verify. Do not create empty categories solely to mirror every project.
