# Project context instructions

The directories beside this file contain context for individual projects. Project context describes a specific product's purpose, architecture, backend, front-end design, packages, paths, themes, documentation, and other notes.

## Applicability

Read only the directory that matches the project currently being discussed or modified. Do not load unrelated project context merely because it is available.

Within the matching directory, open only the files whose subjects affect the current task. Do not load the entire project directory by default.

Project-specific context supplements the shared AI Brain rules. An explicit project-specific decision takes precedence over a shared preference when both apply to the same concern. Required shared rules continue to apply unless a higher-priority instruction explicitly overrides them.

## Applying project context

1. Identify the current project by repository and product name.
2. Open the matching directory under `{project-path}\projects`.
3. Read the files relevant to the current task, such as architecture for boundary changes or themes and colors for front-end design.
4. Treat project files as context, not as permission to modify the referenced repository.
5. Keep project-specific details out of shared rules unless the user explicitly promotes them to a reusable convention.

When no matching directory exists, rely on the current repository, the user's request, and the applicable shared rules. Do not infer that another project's decisions apply.
