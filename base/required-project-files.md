# Required project files

This document identifies the project file sets to apply when the `required-project-files` optional rule is active.

Project file requirements are separated by applicability so that an agent only needs to read the instructions relevant to the current project.

## Applying the file sets

Always read and apply the all-project file set:

- **All projects:** `{project-path}\base\project-files\all\instructions.md`

Then identify the project types present and read only the matching project-specific file sets:

- **C# projects:** `{project-path}\base\project-files\csharp\instructions.md`

Apply every instruction in each selected file set. Do not read or apply a project-specific file set when its project type is not present.

## Important notice

Text enclosed in double braces, such as `{{instruction}}`, is instructional placeholder text inside the project file templates.

Before adding a template file to a project, replace or remove every double-braced placeholder. Double-braced instructional text must not appear in the final project file.
