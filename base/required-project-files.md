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
