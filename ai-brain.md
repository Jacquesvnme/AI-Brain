# AI Brain

The AI Brain is the central index of rules and guidance used across projects.

Read every required rule before working on a project. Review the optional rules and apply only those relevant to the current project or task.

## Variables

**project-path:** `C:\~ My Files\AI-Brain`

The `project-path` variable is the absolute path to the AI Brain repository. In this file and every file reached from it, resolve `{project-path}` to the value above before using a path.

If the repository moves, update `project-path` here. Paths that begin with `{project-path}` do not need to be edited individually. Also update any standalone bootstrap file that must locate `ai-brain.md` before this variable is available.

## Project context

If the purpose of the AI Brain project or repository is unclear, read its project description before continuing:

- **description.md:** `{project-path}\projects\ai-brain\description.md`

## Required rules

Required rules apply to every project and task.

### Rules

- **codegraph.md:** `{project-path}\rules\required\codegraph.md`

## Optional rules

Optional rules apply only when their contents match the current project or task, or when the user explicitly requests them.

Review each optional rule before starting work and apply only the relevant rules.

### Rules

- **project-creation.md:** `{project-path}\rules\optional\project-creation.md`
- **required-project-files.md:** `{project-path}\rules\optional\required-project-files.md`
- **project-layout.md:** `{project-path}\rules\optional\project-layout.md`
