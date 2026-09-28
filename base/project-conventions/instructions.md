# Project conventions instructions

This document is the central index for implementation, design, documentation, and workflow conventions shared by projects that use the AI Brain. Project conventions define how code and interfaces should be shaped after project layout and file placement have been decided.

These instructions complement the other project guidance:

- project-layout instructions define which component projects exist and where they are located;
- project-structure instructions define where files and directories belong;
- project-creation instructions define how projects are created; and
- project conventions define the preferred design, content, behavior, and engineering character of the implementation.

## Instruction strength

Interpret statements in the convention files using these levels:

- **Required:** Follow the instruction unless it conflicts with a higher-priority user or project requirement.
- **Preferred:** Use this as the default, but depart from it when the product, technology, or existing code gives a concrete reason.
- **Contextual:** Evaluate the tradeoff for the current task; do not apply the instruction mechanically.
- **Avoid:** Treat the approach as undesirable unless a specific constraint makes it appropriate.

An explicit user requirement and an established project-specific convention take precedence over a shared preference. Preserve intentional local consistency when changing an existing project. Do not redesign unrelated code merely because a shared convention differs.

## Applying the instructions

1. Identify which implementation concerns the task creates or changes.
2. Read the central instructions in this file.
3. Read only the detailed convention files that match those concerns.
4. Inspect the existing project for established local patterns before applying a preference.
5. Apply required conventions and use preferred conventions as defaults.
6. Resolve conflicts in this order: explicit user direction, project-specific instructions, established intentional project patterns, then shared AI Brain preferences.
7. Verify the result using the tests, builds, visual review, or documentation checks appropriate to the work.

Do not load every detailed file for every task. The purpose of this index is to route work to the smallest relevant instruction set.

## General conventions

- **comments-and-documentation.md:** Read when creating or revising comments, XML documentation, README content, or other technical prose. `{project-path}\base\project-conventions\instructions\comments-and-documentation.md`
- **errors-and-results.md:** Read when defining failures, exceptions, validation outcomes, or result types. `{project-path}\base\project-conventions\instructions\errors-and-results.md`
- **handlers.md:** Read when creating or changing application handlers. `{project-path}\base\project-conventions\instructions\handlers.md`

## API conventions

- **controllers.md:** Read when creating or changing API controllers. `{project-path}\base\project-conventions\instructions\api\controllers.md`
- **validators.md:** Read when creating or changing API input validators or controller validation flow. `{project-path}\base\project-conventions\instructions\api\validators.md`

## Domain conventions

- **enum.md:** Read when creating or changing enumerations. `{project-path}\base\project-conventions\instructions\domain\enum.md`
- **models.md:** Read when creating or changing domain models or shared contracts. `{project-path}\base\project-conventions\instructions\domain\models.md`
- **requests.md:** Read when creating or changing request contracts. `{project-path}\base\project-conventions\instructions\domain\requests.md`
- **responses.md:** Read when creating or changing response contracts. `{project-path}\base\project-conventions\instructions\domain\responses.md`
- **value-objects.md:** Read when creating or changing value objects or shared handler response bases. `{project-path}\base\project-conventions\instructions\domain\value-objects.md`

## Infrastructure conventions

- **entities.md:** Read when creating or changing persistence entities. `{project-path}\base\project-conventions\instructions\infrastructure\entities.md`

## Front-end conventions

- **theme.md:** Read when defining or changing colors, theme tokens, geometry, elevation, glass, glow, dark mode, or light mode. `{project-path}\base\project-conventions\instructions\theme.md`
- **front-end-design.md:** Read for any task that creates or materially changes a user interface. `{project-path}\base\project-conventions\instructions\front-end-design.md`

## Related skills

Skills are catalogued separately from project conventions at `{project-path}\skills\skills.md`. Follow a linked skill when it matches the task, but keep the applicable conventions in this directory as the definition of the desired project result.

For an explicit review of changes since a fixed Git reference, read `{project-path}\skills\external\code-review.md`. For module interfaces, seams, testability, or architectural restructuring, read `{project-path}\skills\external\codebase-design.md` and, when the task is specifically an architecture improvement, `{project-path}\skills\external\improve-codebase-architecture.md`.

## Planning-only files

Files explicitly marked for future implementation are planning notes only. Do not apply, edit, rename, expand, or cite them as active conventions unless the user explicitly asks to work on those files.
