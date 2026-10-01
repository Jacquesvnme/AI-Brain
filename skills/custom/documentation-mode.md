# Documentation Mode

Documentation Mode controls whether an agent maintains the AI Brain's project-specific context for the current project. Reading this workflow is required, but its upkeep actions are controlled by the current project's local setting.

## Project-local setting

Read the `AGENTS.md` file in the topmost directory of the current project. Use the setting under its `## Rules` section:

```markdown
- **Documentation Mode:** `enabled`
```

The valid values are `enabled` and `disabled`.

- `enabled` activates the workflow in this file.
- `disabled` activates the read-only behavior defined below.
- If the setting is absent, treat Documentation Mode as `enabled` so that existing projects retain the default behavior.
- If the setting has any other value, do not guess. Report the invalid value and leave project-context documentation unchanged.

The current project's top-level `AGENTS.md` is authoritative for this setting. Do not use the AI Brain repository's `AGENTS.md` as the setting for a different project.

## Read-only behavior when disabled

Continue to locate the current project's existing directory under `{project-path}\projects` and read the context files relevant to the task. Treat that directory and all of its contents as read-only: do not create, modify, rename, move, or delete project-context directories or files through Documentation Mode.

If no matching project-context directory exists, do not create one. Rely on the current repository, the user's request, and applicable shared rules instead. A direct user request to create or change project-context documentation is separate authorization and may override read-only mode only for the requested work.

## Workflow when enabled

1. Read `{project-path}\projects\projects.md` and follow its routing instructions.
2. Apply its project selection and upkeep instructions to the current repository or product.
3. If the project-context directory does not exist and material facts need to be recorded, follow the creation authorization and naming rules in `{project-path}\projects\project-upkeep.md`.

If no current repository or product can be identified, no project upkeep is required.

## Boundaries

Documentation Mode authorizes only the project-context creation and upkeep defined in `{project-path}\projects\project-upkeep.md`. It does not authorize unrelated project changes.
