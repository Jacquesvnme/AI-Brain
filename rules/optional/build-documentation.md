# Build Documentation

**rule-name:** build-documentation
**absolute-path:** `{project-path}\skills\custom\build-documentation.md`
**absolute-directory:** `{project-path}\skills\custom`
**rule-description:**

Apply this optional rule when the user explicitly requests `Create Build Documentation`, or when current work may constitute a materially significant build that should be recommended for documentation.

A line count may support the decision but must never decide it independently. Approximately 20 to 30 substantive, hand-written production lines can be a useful signal. A smaller security or authentication change can still be material, while approximately 100 lines of formatting, mechanical renaming, generated output, or routine method restructuring may not be.

Treat a change as materially significant when it includes one or more of the following:

- a new user-visible capability;
- a changed API, data model, schema, persistence strategy, or security boundary;
- a new component or integration;
- a change spanning multiple architectural layers;
- a substantial behavioral refactor;
- a migration, compatibility concern, or deployment consequence; or
- an explicit user request to create Build Documentation.

When a change qualifies but the user has not issued the command, recommend Build Documentation without creating it. The exact command authorizes the documentation work only; it does not authorize implementation changes.

Follow the referenced workflow for creation, updating, Git tracking, and completion behavior.

Create each record from `{project-path}\base\project-files\documentation\templates\0000-build-template.md` according to the referenced workflow.
