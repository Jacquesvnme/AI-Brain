# AI Brain

The AI Brain is the central routing index for rules, instructions, skills, and project context.

Read every required rule.

## Variables

**project-path:** `C:\~ My Files\AI-Brain`

The `project-path` variable is the absolute path to the AI Brain repository. In this file and every file reached from it, resolve `{project-path}` to the value above before using a path.

If the repository moves, update this value and any standalone bootstrap reference that must locate `ai-brain.md` before the variable is available.

## Rules

- **rules.md:** `{project-path}\rules\rules.md`

## Project base

- **base.md:** Optional navigation for project guidance relevant to the task. `{project-path}\base\base.md`

## Project context

- **projects.md:** `{project-path}\projects\projects.md`

## Skills

- **skills.md:** `{project-path}\skills\skills.md`
