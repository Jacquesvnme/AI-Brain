# Project structure instructions

This document defines how to apply the standard internal structure of each project in a solution. Project-structure instructions describe the directories and files beneath an individual project directory, including their responsibilities and the conventions governing where code belongs.

These instructions complement the other project guidance:

- project-layout instructions define which projects belong in the solution and where each `.csproj` or `.esproj` project is located;
- project-creation instructions define how those projects are created; and
- project-structure instructions define how the contents of each created project are organized.

## Variables

**PROJECT_NAME:** The actual name of the application or solution. Replace every `PROJECT_NAME` placeholder in project names, directory names, filenames, namespaces, and examples with this value.

For example, if the application is named `SuperDummyApplication`, `PROJECT_NAME.Domain` becomes `SuperDummyApplication.Domain`.

## Applying the instructions

1. Identify the projects that are present in the solution or included in the current task.
2. Read only the individual project-structure instructions that match those projects.
3. Replace every `PROJECT_NAME` placeholder with the actual project name.
4. Use each documented tree as the default internal layout for that project.
5. Place files according to the documented directory responsibilities and naming conventions.
6. Apply explicit project-specific or user-provided requirements when they differ from a default structure.
7. When an individual instruction states that no opinion has been defined, use reasonable conventions appropriate to that project's responsibilities without treating them as an AI Brain standard.

When reviewing an existing project, compare only the applicable project-structure instructions against that project. Do not restructure unrelated projects, and do not modify an existing structure unless the task includes creating, restructuring, or correcting it.
