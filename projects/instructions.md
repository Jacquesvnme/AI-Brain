# Project context instructions

The directories beside this file contain context for individual projects. Project context describes a specific product's purpose, architecture, backend, front-end design, packages, paths, themes, documentation, and other notes.

## Applicability

Identify the project currently being discussed or modified and look for its matching directory under `{project-path}\projects`. When a matching directory exists, use it as the project's context source.

Project-specific context supplements the shared AI Brain rules. An explicit project-specific decision takes precedence over a shared preference when both apply to the same concern. Required shared rules continue to apply unless a higher-priority instruction explicitly overrides them.

## Project upkeep

When project-context upkeep applies, read and follow:

`{project-path}\projects\project-upkeep.md`

That file defines the upkeep mechanics and the responsibility of each project-context file.

## Applying project context

1. Identify the current project by repository and product name.
2. Look for its matching directory under `{project-path}\projects` and read only the context files relevant to the current work.
3. Treat project files as context, not as permission to modify the referenced repository.
4. Keep project-specific details out of shared rules unless the user explicitly promotes them to a reusable convention.

When no matching directory exists, do not infer that another project's decisions apply.
