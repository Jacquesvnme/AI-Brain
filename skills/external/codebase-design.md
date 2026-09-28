# Codebase Design skill

## Purpose

Use Codebase Design as shared vocabulary for designing deep modules: substantial behavior behind a small interface, placed at a clean seam and testable through that interface. It helps reason about module depth, leverage, locality, adapters, and test surfaces.

## Use when

- designing or reshaping a module interface;
- deciding where a seam belongs;
- reducing a shallow or overly broad interface;
- making a codebase easier to test or navigate; or
- another architecture skill requires the deep-module vocabulary.

## Invoke

Use `$codebase-design` where supported, or say:

```text
Use the codebase-design skill to evaluate these module boundaries and interfaces.
```

## Install

```powershell
npx skills add https://github.com/mattpocock/skills --skill codebase-design
```

## References

- [skills.sh publisher page](https://www.skills.sh/mattpocock/skills)
- [Source repository](https://github.com/mattpocock/skills)

## Relationship to architecture improvement

This skill supplies the vocabulary and principles. Use `improve-codebase-architecture` when the task is to inspect an existing codebase, find architectural friction, and propose concrete refactors.
