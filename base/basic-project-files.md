# Required base files

This document defines the base files to add when the `basic-requirements` optional rule applies.

An untagged file section applies to every project type. A section containing an applicability tag applies only when the project matches that tag.

Example: `### File name {{C#}}` applies only to C# projects.

Follow the destination instructions in each section. Each section must provide the absolute path to its example file.

## Important notice

Text enclosed in double braces, such as `{{instruction}}`, is instructional placeholder text inside the example files.

Before adding an example file to a project, replace or remove every double-braced placeholder. Double-braced instructional text must not appear in the final project file.

## Example file navigation

- **.csharpierrc.json:** `Z:\AI-Brain\base\example-files\.csharpierrc.json`
- **.editorconfig:** `Z:\AI-Brain\base\example-files\.editorconfig`
- **.gitignore:** `Z:\AI-Brain\base\example-files\.gitignore`
- **AGENTS.md:** `Z:\AI-Brain\base\example-files\AGENTS.md`
- **Creation.md:** `Z:\AI-Brain\base\example-files\Creation.md`
- **DeleteBins.ps1:** `Z:\AI-Brain\base\example-files\DeleteBins.ps1`
- **dotnet-tools.json:** `Z:\AI-Brain\base\example-files\dotnet-tools.json`
- **LICENSE:** `Z:\AI-Brain\base\example-files\LICENSE`
- **ProjectExporter.ps1:** `Z:\AI-Brain\base\example-files\ProjectExporter.ps1`
- **README.md:** `Z:\AI-Brain\base\example-files\README.md`

## Sections

Apply every untagged section and every tagged section that matches the project type.

### .csharpierrc.json {{C#}}

Copy the example `.csharpierrc.json` into the outer project directory without changing its filename or contents.

The file defines the CSharpier formatting rules for C#, project, configuration, and supported XML files.

#### Example file

`Z:\AI-Brain\base\example-files\.csharpierrc.json`

### .editorconfig {{C#}}

Copy the example `.editorconfig` into the outer project directory without changing its filename or contents.

The file defines shared formatting, indentation, namespace, and code-style rules for the project.

#### Example file

`Z:\AI-Brain\base\example-files\.editorconfig`

### .gitignore {{C#}}

Copy the example `.gitignore` into the outer project directory without changing its filename.

Use the provided file directly. Do not generate another `.gitignore` with the .NET CLI.

#### Example file

`Z:\AI-Brain\base\example-files\.gitignore`

### AGENTS.md

Copy the example `AGENTS.md` into the outer project directory without changing its filename.

The file must direct Codex to read and follow the rules in the central AI Brain before modifying the project.

The reference to the AI Brain must include its absolute path:

`Z:\AI-Brain\ai-brain.md`

Required rules always apply. Optional rules apply only when their description matches the current work or when the user explicitly requests them.

#### Example file

`Z:\AI-Brain\base\example-files\AGENTS.md`

### Creation.md

Copy the example `Creation.md` into the outer project directory.

`Creation.md` records the exact commands used to create every component project and add its direct package dependencies.

In this file, **project** means a project defined by a `.csproj` or `.esproj` file. It does not mean the `.sln` or `.slnx` solution file.

Create one section for every `.csproj` and `.esproj` project in the solution.

For each project, include:

- the full project name;
- the exact command or commands used in PowerShell to create it; and
- the exact package-manager command used to add each direct package dependency.

If no packages were added to a project, omit its package-command list.

Replace or remove every double-braced placeholder before adding the file to the project.

#### Example file

`Z:\AI-Brain\base\example-files\Creation.md`

### DeleteBins.ps1 {{C#}}

Copy the example `DeleteBins.ps1` into the outer project directory without changing its filename or contents.

The script recursively deletes directories named `bin` or `obj`. It does not search inside `.git`, `.vs`, `.codegraph`, or `node_modules` directories. It also skips reparse points.

#### Example file

`Z:\AI-Brain\base\example-files\DeleteBins.ps1`

### dotnet-tools.json {{C#}}

Create a `.config` directory inside the outer project directory.

Copy the example `dotnet-tools.json` into that directory without changing its filename or contents. Its final location must be:

`.config\dotnet-tools.json`

The manifest provides the local CSharpier tool used by the project.

Restore the tool by running this command from the outer project directory:

```powershell
dotnet tool restore
```

#### Example file

`Z:\AI-Brain\base\example-files\dotnet-tools.json`

### LICENSE

Copy the example `LICENSE` into the outer project directory without changing its filename.

The example contains the Apache License 2.0. Replace `{{Current year in the format: yyyy}}` with the current four-digit year.

Do not modify the remaining license text or the copyright holder’s name.

#### Example file

`Z:\AI-Brain\base\example-files\LICENSE`

### ProjectExporter.ps1 {{C#}}

`ProjectExporter.ps1` publishes the project as a self-contained Windows application.

Add the file to the outer project directory only when the solution contains a `PROJECT_NAME.Desktop.csproj` or `PROJECT_NAME.Api.csproj` file.

The script derives `PROJECT_NAME` from the name of the directory containing the script. Do not add project-specific paths to the script.

The script selects the publish target in this order:

1. `PROJECT_NAME.Desktop.csproj`
2. `PROJECT_NAME.Api.csproj`

The API project is used only when the Desktop project does not exist. If neither project exists, the script stops without publishing.

The output is written to `PROJECT_NAME.Deployment` inside the outer project directory. Any existing deployment directory is deleted before publishing.

#### Example file

`Z:\AI-Brain\base\example-files\ProjectExporter.ps1`

### README.md

Copy the example `README.md` into the outer project directory without changing its filename.

Replace `PROJECT_NAME` with the actual project name.

Remove the double-braced instructional placeholder. Do not add a project description; the user will add it manually.

#### Example file

`Z:\AI-Brain\base\example-files\README.md`