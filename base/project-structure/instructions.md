# Project structure instructions

This document defines how to apply the standard internal structure of each project in a solution. Project-structure instructions describe the directories and files beneath an individual project directory, including their responsibilities and the conventions governing where code belongs.

These instructions complement the other project guidance:

- project-layout instructions define which projects belong in the solution and where each `.csproj` or `.esproj` project is located;
- project-creation instructions define how those projects are created; and
- project-structure instructions define how the contents of each created project are organized.

## Variables

**PROJECT_NAME:** The actual name of the application or solution. Replace every `PROJECT_NAME` placeholder in project names, directory names, filenames, namespaces, and examples with this value.

For example, if the application is named `SuperDummyApplication`, `PROJECT_NAME.Domain` becomes `SuperDummyApplication.Domain`.

## Project structure navigation

- **project-api.md:** `{project-path}\base\project-structure\instructions\project-api.md`
- **project-console.md:** `{project-path}\base\project-structure\instructions\project-console.md`
- **project-desktop.md:** `{project-path}\base\project-structure\instructions\project-desktop.md`
- **project-domain.md:** `{project-path}\base\project-structure\instructions\project-domain.md`
- **project-identity.md:** `{project-path}\base\project-structure\instructions\project-identity.md`
- **project-infrastructure.md:** `{project-path}\base\project-structure\instructions\project-infrastructure.md`
- **project-test.md:** `{project-path}\base\project-structure\instructions\project-test.md`
- **project-ui.md:** `{project-path}\base\project-structure\instructions\project-ui.md`

## Applying the instructions

1. Identify the projects that are present in the solution or included in the current task.
2. Replace every `PROJECT_NAME` placeholder with the actual project name.
3. Use each documented tree as the default internal layout for that project.
4. Place files according to the documented directory responsibilities and naming conventions.
5. Apply explicit project-specific or user-provided requirements when they differ from a default structure.
6. When an individual instruction states that no opinion has been defined, use reasonable conventions appropriate to that project's responsibilities without treating them as an AI Brain standard.

When reviewing an existing project, compare only the applicable project-structure instructions against that project. Do not restructure unrelated projects, and do not modify an existing structure unless the task includes creating, restructuring, or correcting it.

When a structure decision depends on module interfaces, seams, adapters, testability, or architectural locality, read `{project-path}\skills\external\codebase-design.md`. For an explicit architecture-improvement task, also read `{project-path}\skills\external\improve-codebase-architecture.md` before proposing structural changes.
