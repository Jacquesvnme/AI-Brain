# Project context instructions

The directories beside this file contain context for individual projects. Project context describes a specific product's purpose, architecture, backend, front-end design, packages, paths, themes, documentation, and other notes.

## Applicability

Use the directory that matches the project currently being discussed or modified.

Project-specific context supplements the shared AI Brain rules. An explicit project-specific decision takes precedence over a shared preference when both apply to the same concern. Required shared rules continue to apply unless a higher-priority instruction explicitly overrides them.

## Applying project context

1. Identify the current project by repository and product name.
2. Open the matching directory under `{project-path}\projects`.
3. Treat project files as context, not as permission to modify the referenced repository.
4. Keep project-specific details out of shared rules unless the user explicitly promotes them to a reusable convention.

When no matching directory exists, rely on the current repository, the user's request, and the applicable shared rules. Do not infer that another project's decisions apply.
