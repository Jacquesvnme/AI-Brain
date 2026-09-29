# Grill Me skill

## Purpose

Use Grill Me to stress-test a plan, product decision, specification, or architecture through systematic questioning. It explores the decision tree until assumptions, tradeoffs, dependencies, and unresolved choices are explicit.

## Use when

- the user asks to be grilled, challenged, or questioned relentlessly;
- an important plan needs adversarial review before implementation;
- a design contains hidden product or architectural decisions; or
- premature implementation would be more expensive than clarifying the decision tree.

## Invoke

Ask directly:

```text
Use Grill Me to stress-test this plan before implementation.
```

Depending on the installed version and agent, the exposed skill name may be `grill-me` or `grilling`. Use the name declared by the installed `SKILL.md` when direct `$skill-name` invocation is required.

## Install

```powershell
npx skills add https://github.com/mattpocock/skills --skill grill-me
```

## References

- [skills.sh listing](https://www.skills.sh/mattpocock/skills/grill-me)
- [Source repository](https://github.com/mattpocock/skills)

## Workflow note

This skill is interactive by design. Do not use it when the user has already supplied a sufficiently specific implementation request and expects execution rather than another planning interview.
