# AI Brain

The AI Brain is the central routing index for rules, instructions, skills, and project context.

Read every required rule. Review the compact optional-rule, skill, and project-context descriptors, then follow only the paths whose descriptions match the current task. Do not recursively load every referenced file.

## Variables

**project-path:** `C:\~ My Files\AI-Brain`

The `project-path` variable is the absolute path to the AI Brain repository. In this file and every file reached from it, resolve `{project-path}` to the value above before using a path.

If the repository moves, update this value and any standalone bootstrap reference that must locate `ai-brain.md` before the variable is available.

## Project context

- **projects.md:** `{project-path}\projects\projects.md`

## Skills

- **skills.md:** `{project-path}\skills\skills.md`

## Required rules

Required rules apply to every project and task.

- **codegraph.md:** `{project-path}\rules\required\codegraph.md`
- **read-only-content.md:** `{project-path}\rules\required\read-only-content.md`
- **project-conventions.md:** `{project-path}\rules\required\project-conventions.md`
- **project-upkeep.md:** `{project-path}\rules\required\project-upkeep.md`

## Optional rules

Optional rules apply only when their descriptions match the current task or the user explicitly requests them. Read the descriptors to decide; follow only matching references.

- **project-creation.md:** `{project-path}\rules\optional\project-creation.md`
- **project-layout.md:** `{project-path}\rules\optional\project-layout.md`
- **project-structure.md:** `{project-path}\rules\optional\project-structure.md`
- **required-project-files.md:** `{project-path}\rules\optional\required-project-files.md`
- **visualize-ui.md:** `{project-path}\rules\optional\visualize-ui.md`
