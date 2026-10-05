# Frontend Design skill

## Purpose

Use Frontend Design to create distinctive, intentional interfaces and to avoid generic template or AI-generated visual patterns. It provides a design process covering product-specific direction, typography, layout, palette, content, motion, restraint, implementation, and visual critique.

This skill is the preferred companion to the project theme and front-end design conventions. The AI Brain conventions describe the user's recurring preferences; the skill helps turn those preferences and the current product brief into a specific design.

## Use when

- creating a new page, application shell, dashboard, landing page, or component system;
- materially redesigning an existing interface;
- selecting typography, palette, composition, or motion;
- reviewing whether a UI looks generic or overly generated; or
- the user explicitly requests `frontend-design`.

Do not require it for a tiny styling correction that already has an obvious local pattern.

## Invoke

Use `$frontend-design` where direct skill invocation is supported, or say:

```text
Use the frontend-design skill to design or critique this interface.
```

For best results, provide the product, audience, primary task, relevant content, technical constraints, and any visual references.

## Install

```powershell
npx skills add https://github.com/anthropics/skills --skill frontend-design
```

## References

- [skills.sh listing](https://www.skills.sh/anthropics/skills/frontend-design)
- [Source repository](https://github.com/anthropics/skills)

## Project-specific note

Apply the skill together with `{project-path}\base\project-conventions\instructions\ui\theme.md` and `{project-path}\base\project-conventions\instructions\ui\front-end-design.md`. When the work covers an application shell or application-wide experience, also apply `{project-path}\base\project-conventions\instructions\ui\application-experience.md`. Do not let a generic recommendation from the skill override the requested minimal, accent-led, internally consistent design direction or an established local design system.
