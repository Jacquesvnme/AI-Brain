# Project layout instructions

This document defines how to select and apply the standard solution-level layout for a project. A project layout determines which component projects belong in the solution, where their `.csproj` or `.esproj` files are located, and which shared files remain in the outer solution directory.

These instructions complement the other project guidance:

- project-creation instructions define how the solution and component projects are created;
- project-layout instructions define where the created projects and shared files belong; and
- project-structure instructions define how files are organized inside each component project.

## Variables

**PROJECT_NAME:** The actual name of the application or solution. Replace every `PROJECT_NAME` placeholder in directory names, project names, filenames, and layout examples with this value.

The outer solution directory and inner source directory use the same project name. For example, a project named `SuperDummyApplication` has an outer `SuperDummyApplication` directory containing an inner `SuperDummyApplication` source directory.

## Layout selection

Select exactly one layout based on the requested solution type:

- **All:** Use for a custom solution layout or when none of the specialized layouts match.
- **Console:** Use for a console application without API, Desktop, or UI projects.
- **React Web API:** Use when the solution requires a React UI and Web API without a Desktop application.
- **React Web API with Desktop:** Use when the solution requires a React UI, Web API, and Windows Desktop application.

Treat each layout as the standard default for its solution type. Explicit user requirements to add or omit component projects take precedence. When the requested component set differs from a standard layout, start with the closest applicable layout and document the project-specific difference rather than combining multiple layouts.

## Layout instructions

- **all.md:** `{project-path}\base\project-layout\instructions\all.md`
- **console.md:** `{project-path}\base\project-layout\instructions\console.md`
- **react-web-api.md:** `{project-path}\base\project-layout\instructions\react-web-api.md`
- **react-web-api-desktop.md:** `{project-path}\base\project-layout\instructions\react-web-api-desktop.md`

## Applying the instructions

1. Determine the requested solution type and required component projects.
2. Select one layout from the list above and read its individual instruction file.
3. Replace every `PROJECT_NAME` placeholder with the actual project name.
4. Create or arrange the outer solution directory, inner source directory, component project directories, and shared files according to the selected layout.
5. Apply explicit project-specific requirements when they differ from the standard layout, without changing unrelated projects or files.
6. Use the project-creation instructions to create any missing solution or component projects.
7. Use the project-structure instructions to organize the contents of each component project.
8. Verify that every generated `.slnx`, `.csproj`, and `.esproj` path matches the final layout and that the solution references the correct relative project paths.

Do not apply a project layout merely while inspecting an existing solution. Restructure an existing solution only when the task explicitly includes creating, restructuring, or correcting its layout.

## Architecture skills

For a non-standard layout whose project seams or responsibilities need architectural design, read `{project-path}\skills\external\codebase-design.md`. When the user asks to analyze or improve the architecture of an existing solution, also read `{project-path}\skills\external\improve-codebase-architecture.md`.

These skills help evaluate interfaces, coupling, locality, and project responsibilities. They do not override the selected standard layout or authorize restructuring unless the user requested that change.
