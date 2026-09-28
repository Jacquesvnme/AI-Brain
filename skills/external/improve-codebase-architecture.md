# Improve Codebase Architecture skill

## Purpose

Use Improve Codebase Architecture to locate architectural friction and propose module-deepening refactors that improve testability, locality, and AI navigability. It looks for shallow modules, tangled dependencies, unstable seams, and interfaces that expose too much implementation detail.

## Use when

- the user explicitly asks to improve codebase architecture;
- repeated changes indicate a structural hotspot;
- a subsystem is difficult to test or understand through its interface;
- responsibilities are spread across tightly coupled files; or
- architectural alternatives need to be compared before refactoring.

## Invoke

Use `$improve-codebase-architecture` where supported, or say:

```text
Use the improve-codebase-architecture skill to analyze this subsystem and recommend deepening opportunities.
```

## Install

```powershell
npx skills add https://github.com/mattpocock/skills --skill improve-codebase-architecture
```

## References

- [skills.sh listing](https://www.skills.sh/mattpocock/skills/improve-codebase-architecture)
- [Source repository](https://github.com/mattpocock/skills)

## Dependencies and scope

Use the `codebase-design` skill for its required deep-module vocabulary. Inspect the project's domain context and architectural decisions before proposing changes. A request to analyze architecture does not by itself authorize implementation; implement refactors only when the user asks for them.
