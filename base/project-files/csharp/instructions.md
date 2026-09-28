# Files required for C# projects

This file defines the additional standard files required when a solution contains one or more C# projects represented by `.csproj` files.

Apply every section in this file in addition to the all-project file set. Copy each referenced template to the destination specified by its section.

These instructions complement the all-project file instructions, project creation, and project layout. Apply them from the outer solution directory and preserve a generated, populated solution file when the project-creation instructions require updating it instead of copying the solution template.

## Variables

**PROJECT_NAME:** The actual application or solution name. It must match the outer solution directory, the inner source directory, and the project-name placeholders used by the applicable layout.

## Template file navigation

- **.csharpierrc.json:** `{project-path}\base\project-files\csharp\templates\.csharpierrc.json`
- **.editorconfig:** `{project-path}\base\project-files\csharp\templates\.editorconfig`
- **.gitattributes:** `{project-path}\base\project-files\csharp\templates\.gitattributes`
- **.gitignore:** `{project-path}\base\project-files\csharp\templates\.gitignore`
- **DeleteBins.ps1:** `{project-path}\base\project-files\csharp\templates\DeleteBins.ps1`
- **Directory.Build.props:** `{project-path}\base\project-files\csharp\templates\Directory.Build.props`
- **dotnet-tools.json:** `{project-path}\base\project-files\csharp\templates\dotnet-tools.json`
- **Project.slnx:** `{project-path}\base\project-files\csharp\templates\Project.slnx`
- **ProjectExporter.ps1:** `{project-path}\base\project-files\csharp\templates\ProjectExporter.ps1`

## .csharpierrc.json

Copy the template `.csharpierrc.json` into the outer project directory without changing its filename or contents.

The file defines the CSharpier formatting rules for C#, project, configuration, and supported XML files.

### Template file

`{project-path}\base\project-files\csharp\templates\.csharpierrc.json`

## .editorconfig

Copy the template `.editorconfig` into the outer project directory without changing its filename or contents.

The file defines shared formatting, indentation, namespace, and code-style rules for the project.

### Template file

`{project-path}\base\project-files\csharp\templates\.editorconfig`

## .gitattributes

Copy the template `.gitattributes` into the outer project directory without changing its filename or contents.

The file defines how Git handles line endings and binary files. It normalizes text files, uses LF line endings for source and configuration files, preserves CRLF line endings for Windows scripts, and prevents Git from treating supported image files as text.

### Template file

`{project-path}\base\project-files\csharp\templates\.gitattributes`

## .gitignore

Copy the template `.gitignore` into the outer project directory without changing its filename.

Use the provided file directly. Do not generate another `.gitignore` with the .NET CLI.

### Template file

`{project-path}\base\project-files\csharp\templates\.gitignore`

## DeleteBins.ps1

Copy the template `DeleteBins.ps1` into the outer project directory without changing its filename or contents.

The script recursively deletes directories named `bin` or `obj`. It does not search inside `.git`, `.vs`, `.codegraph`, or `node_modules` directories. It also skips reparse points.

### Template file

`{project-path}\base\project-files\csharp\templates\DeleteBins.ps1`

## Directory.Build.props

Copy the template `Directory.Build.props` into the outer project directory without changing its filename or contents.

Place it in the top-most project directory, next to the `.slnx` solution file. Its settings apply to all `.csproj` projects in that directory and its subdirectories.

The file enables build-time enforcement of code-style rules that are configured as warnings or errors.

### Template file

`{project-path}\base\project-files\csharp\templates\Directory.Build.props`

## dotnet-tools.json

Create a `.config` directory inside the outer project directory.

Copy the template `dotnet-tools.json` into that directory without changing its filename or contents. Its final location must be:

`.config\dotnet-tools.json`

The manifest provides the local CSharpier tool used by the project.

Restore the tool by running this command from the outer project directory:

```powershell
dotnet tool restore
```

### Template file

`{project-path}\base\project-files\csharp\templates\dotnet-tools.json`

## Project.slnx

Copy the template `Project.slnx` into the outer project directory, next to `Directory.Build.props`.

Rename the file by replacing `Project` with the main project name. The main project name must match the name of the outer project directory.

For example, if the outer project directory is named `SuperDummyApplication`, the solution filename must be:

`SuperDummyApplication.slnx`

Replace every `PROJECT_NAME` placeholder inside the file with the same main project name.

The solution file must contain a relative path to every `.csproj` and `.esproj` project in the solution. Remove template project entries that do not exist, and add entries for any projects not represented by the template.

The `.esproj` entry for `PROJECT_NAME.UI` must always contain both `<Build />` and `<Deploy />`:

```xml
<Project Path="PROJECT_NAME/PROJECT_NAME.UI/PROJECT_NAME.UI.esproj">
  <Build />
  <Deploy />
</Project>
```

Do not add <Build /> or <Deploy /> to the .csproj entries.

### Template file

`{project-path}\base\project-files\csharp\templates\Project.slnx`

## ProjectExporter.ps1

`ProjectExporter.ps1` publishes the project as a self-contained Windows application.

Add the file to the outer project directory only when the solution contains a `PROJECT_NAME.Desktop.csproj` or `PROJECT_NAME.Api.csproj` file.

The script derives `PROJECT_NAME` from the name of the directory containing the script. Do not add project-specific paths to the script.

The script selects the publish target in this order:

1. `PROJECT_NAME.Desktop.csproj`
2. `PROJECT_NAME.Api.csproj`

The API project is used only when the Desktop project does not exist. If neither project exists, the script stops without publishing.

The output is written to `PROJECT_NAME.Deployment` inside the outer project directory. Any existing deployment directory is deleted before publishing.

### Template file

`{project-path}\base\project-files\csharp\templates\ProjectExporter.ps1`

## Applying the instructions

1. Apply the all-project file instructions first.
2. Confirm the actual project name and the component projects present in the solution.
3. Copy each applicable C# template to its documented destination.
4. Rename and populate placeholder-based files as instructed.
5. Update an existing generated `.slnx` rather than overwriting it when project creation has already registered component projects.
6. Remove unused solution entries and add every existing `.csproj` and `.esproj` exactly once with the correct relative path.
7. Restore local tools and verify the final solution, configuration files, and conditional publishing script.
