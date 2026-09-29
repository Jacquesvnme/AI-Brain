# Required project file instructions

This document identifies the project file sets to apply when the `required-project-files` optional rule is active.

Project file requirements are separated by applicability so that an agent only needs to read the instructions relevant to the current project.

These instructions complement project layout and project creation. Apply them after determining the actual component set, and preserve populated generated files when the creation instructions require an in-place update.

## Variables

**PROJECT_NAME:** The actual application or solution name used by the selected templates and destination files.

## Applying the file sets

Always read and apply the all-project file set:

- **All projects:** `{project-path}\base\project-files\all\instructions.md`

Then identify the project types present and read only the matching project-specific file sets:

- **C# projects:** `{project-path}\base\project-files\csharp\instructions.md`

Apply every instruction in each selected file set. Do not read or apply a project-specific file set when its project type is not present.

## Important notice

Text enclosed in double braces, such as `{{instruction}}`, is instructional placeholder text inside the project file templates.

Before adding a template file to a project, replace or remove every double-braced placeholder. Double-braced instructional text must not appear in the final project file.

## Verification

After applying the selected file sets, confirm that every required file exists at its documented destination, all placeholders have been resolved, conditional files match the projects present, and generated solution entries still reference the correct component paths.
