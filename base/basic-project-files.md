# Required base files

This document defines the base files to add when the `basic-requirements` optional rule applies.

Every file section must include an applicability tag:

- `{{All}}` applies to every project type.
- Any other tag applies only when the project matches that tag.

Examples:

- `### README.md {{All}}` applies to every project type.
- `### .editorconfig {{C#}}` applies only to C# projects.

Follow the destination instructions in every applicable section. Each section must provide the absolute path to its example file.

## Important notice

Text enclosed in double braces, such as `{{instruction}}`, is instructional placeholder text inside the example files.

Before adding an example file to a project, replace or remove every double-braced placeholder. Double-braced instructional text must not appear in the final project file.

## Example file navigation

- **.csharpierrc.json:** `{project-path}\base\example-files\.csharpierrc.json`
- **.editorconfig:** `{project-path}\base\example-files\.editorconfig`
- **.gitattributes:** `{project-path}\base\example-files\.gitattributes`
- **.gitignore:** `{project-path}\base\example-files\.gitignore`
- **AGENTS.md:** `{project-path}\base\example-files\AGENTS.md`
- **Creation.md:** `{project-path}\base\example-files\Creation.md`
- **DeleteBins.ps1:** `{project-path}\base\example-files\DeleteBins.ps1`
- **Directory.Build.props:** `{project-path}\base\example-files\Directory.Build.props`
- **dotnet-tools.json:** `{project-path}\base\example-files\dotnet-tools.json`
- **LICENSE:** `{project-path}\base\example-files\LICENSE`
- **Project.slnx:** `{project-path}\base\example-files\Project.slnx`
- **ProjectExporter.ps1:** `{project-path}\base\example-files\ProjectExporter.ps1`
- **README.md:** `{project-path}\base\example-files\README.md`

## Sections

Apply every section tagged `{{All}}` and every section whose applicability tag matches the project type. Do not apply sections with nonmatching tags.

### .csharpierrc.json {{C#}}

Copy the example `.csharpierrc.json` into the outer project directory without changing its filename or contents.

The file defines the CSharpier formatting rules for C#, project, configuration, and supported XML files.

#### Example file

`{project-path}\base\example-files\.csharpierrc.json`

### .editorconfig {{C#}}

Copy the example `.editorconfig` into the outer project directory without changing its filename or contents.

The file defines shared formatting, indentation, namespace, and code-style rules for the project.

#### Example file

`{project-path}\base\example-files\.editorconfig`

### .gitattributes {{C#}}

Copy the example `.gitattributes` into the outer project directory without changing its filename or contents.

The file defines how Git handles line endings and binary files. It normalizes text files, uses LF line endings for source and configuration files, preserves CRLF line endings for Windows scripts, and prevents Git from treating supported image files as text.

#### Example file

`{project-path}\base\example-files\.gitattributes`

### .gitignore {{C#}}

Copy the example `.gitignore` into the outer project directory without changing its filename.

Use the provided file directly. Do not generate another `.gitignore` with the .NET CLI.

#### Example file

`{project-path}\base\example-files\.gitignore`

### AGENTS.md {{All}}

Copy the example `AGENTS.md` into the outer project directory without changing its filename.

The file must direct Codex to read and follow the rules in the central AI Brain before modifying the project.

The reference to the AI Brain must include its absolute path:

`C:\~ My Files\AI-Brain\ai-brain.md`

Required rules always apply. Optional rules apply only when their description matches the current work or when the user explicitly requests them.

#### Example file

`{project-path}\base\example-files\AGENTS.md`

### Creation.md {{All}}

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

`{project-path}\base\example-files\Creation.md`

### DeleteBins.ps1 {{C#}}

Copy the example `DeleteBins.ps1` into the outer project directory without changing its filename or contents.

The script recursively deletes directories named `bin` or `obj`. It does not search inside `.git`, `.vs`, `.codegraph`, or `node_modules` directories. It also skips reparse points.

#### Example file

`{project-path}\base\example-files\DeleteBins.ps1`

### Directory.Build.props {{C#}}

Copy the example `Directory.Build.props` into the outer project directory without changing its filename or contents.

Place it in the top-most project directory, next to the `.slnx` solution file. Its settings apply to all `.csproj` projects in that directory and its subdirectories.

The file enables build-time enforcement of code-style rules that are configured as warnings or errors.

#### Example file

`{project-path}\base\example-files\Directory.Build.props`

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

`{project-path}\base\example-files\dotnet-tools.json`

### LICENSE {{All}}

Copy the example `LICENSE` into the outer project directory without changing its filename.

The example contains the Apache License 2.0. Replace `{{Current year in the format: yyyy}}` with the current four-digit year.

Do not modify the remaining license text or the copyright holder’s name.

#### Example file

`{project-path}\base\example-files\LICENSE`

### Project.slnx {{C#}}

Copy the example `Project.slnx` into the outer project directory, next to `Directory.Build.props`.

Rename the file by replacing `Project` with the main project name. The main project name must match the name of the outer project directory.

For example, if the outer project directory is named `SuperDummyApplication`, the solution filename must be:

`SuperDummyApplication.slnx`

Replace every `PROJECT_NAME` placeholder inside the file with the same main project name.

The solution file must contain a relative path to every `.csproj` and `.esproj` project in the solution. Remove example project entries that do not exist, and add entries for any projects not represented by the example.

The `.esproj` entry for `PROJECT_NAME.UI` must always contain both `<Build />` and `<Deploy />`:

```xml
<Project Path="PROJECT_NAME/PROJECT_NAME.UI/PROJECT_NAME.UI.esproj">
  <Build />
  <Deploy />
</Project>
```

Do not add <Build /> or <Deploy /> to the .csproj entries.

#### Example file

`{project-path}\base\example-files\Project.slnx`

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

`{project-path}\base\example-files\ProjectExporter.ps1`

### README.md {{All}}

Copy the example `README.md` into the outer project directory without changing its filename.

Replace `PROJECT_NAME` with the actual project name.

Remove the double-braced instructional placeholder. Do not add a project description; the user will add it manually.

#### Example file

`{project-path}\base\example-files\README.md`
