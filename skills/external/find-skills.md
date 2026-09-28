# Find Skills skill

## Purpose

Use Find Skills to discover, compare, and evaluate reusable skills from the open agent-skills ecosystem. It prioritizes established sources, meaningful adoption, inspectable source code, and available security information.

## Use when

- the user asks whether a skill exists for a task;
- a repeated specialist workflow may already be packaged as a skill;
- the user asks to browse, compare, recommend, or install skills; or
- an unavailable capability may be supplied by an external skill.

## Invoke

Use `$find-skills` where supported, or say:

```text
Use the find-skills skill to find and compare skills for this task.
```

The underlying CLI can also search directly:

```powershell
npx skills find QUERY
```

## Install

```powershell
npx skills add https://github.com/vercel-labs/skills --skill find-skills
```

## References

- [skills.sh listing](https://www.skills.sh/vercel-labs/skills/find-skills)
- [Source repository](https://github.com/vercel-labs/skills)
- [Skills directory](https://www.skills.sh/)

## Evaluation requirements

Do not recommend a skill from its name alone. Check its source, maintenance, installation count, publisher reputation, dependencies, permissions or tool expectations, and available security audits. Explain meaningful risks or uncertainty before recommending installation.
