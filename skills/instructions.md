# Skill instructions

This directory is the central catalog for reusable agent workflows used with the AI Brain. It keeps workflow capabilities separate from project conventions: conventions describe the desired project result, while skills describe a repeatable way for an agent to perform a task.

The catalog documents when a skill applies, how it relates to other guidance, and where it came from. These files do not replace an installed skill's `SKILL.md`. When a skill is available, read and follow its active `SKILL.md` before using it because the installed workflow may change independently of this catalog.

Use this file as the catalog router.

## Directory structure

- `custom` contains reusable workflows authored for the user and the AI Brain. They may be activated through a rule even when they are not packaged as an agent skill.
- `catalog` contains catalog entries for bundled OpenAI skills and community skills supplied outside this repository.

The catalog records purpose, provenance, installation guidance, and relationships to AI Brain workflows. A catalog entry documents and routes to a skill; it does not provide or activate that skill. Before claiming to use a skill, confirm that its active `SKILL.md` is available and follow it. If the skill is unavailable, do not claim to have invoked it; use an appropriate fallback or offer the catalog's installation guidance when that matches the user's request.

## Custom workflows

- **build-documentation.md:** Create and maintain a numbered implementation record for a materially significant project build after explicit user authorization. `{project-path}\skills\custom\build-documentation.md`
- **command.md:** Hold state-changing work behind a user-defined command or explicit approval gate until the user intentionally releases it. `{project-path}\skills\custom\command.md`
- **documentation-mode.md:** Use the current project's local setting to control required project-context upkeep. `{project-path}\skills\custom\documentation-mode.md`
- **visualize-ui.md:** Produce a rendered UI concept for critique and approval. `{project-path}\skills\custom\visualize-ui.md`

## Skill catalog

- **code-review.md:** Review a diff separately against repository standards and the originating specification. `{project-path}\skills\catalog\code-review.md`
- **codebase-design.md:** Use deep-module vocabulary to design interfaces, seams, adapters, and testable modules. `{project-path}\skills\catalog\codebase-design.md`
- **find-skills.md:** Discover and evaluate installable skills. `{project-path}\skills\catalog\find-skills.md`
- **frontend-design.md:** Create distinctive, product-specific user interfaces. `{project-path}\skills\catalog\frontend-design.md`
- **grilling.md:** Stress-test a plan or design through structured questioning. `{project-path}\skills\catalog\grilling.md`
- **humanizer.md:** Revise formulaic prose without changing its meaning. `{project-path}\skills\catalog\humanizer.md`
- **imagegen.md:** Generate or edit raster images, including static UI mockups and supporting visual assets. `{project-path}\skills\catalog\imagegen.md`
- **improve-codebase-architecture.md:** Find architectural friction and propose module-deepening refactors. `{project-path}\skills\catalog\improve-codebase-architecture.md`
- **openai-docs.md:** Retrieve current, cited guidance from official OpenAI documentation. `{project-path}\skills\catalog\openai-docs.md`
- **skill-creator.md:** Create, test, evaluate, and improve reusable agent skills. `{project-path}\skills\catalog\skill-creator.md`
- **visualize.md:** Create interactive, in-conversation visualizations and UI mockups. `{project-path}\skills\catalog\visualize.md`

## Selection and invocation

Use a skill when the user explicitly names it or when its documented trigger clearly matches the task. Explain briefly why each selected skill applies.

The most portable invocation is a direct request such as `Use the frontend-design skill to redesign this page.` Where supported, `$skill-name`, `/skill-name`, or a dedicated skill tool may also be used. The user's request, repository instructions, and authorization boundaries take precedence over skill guidance.

## Discovery and installation

Browse [skills.sh](https://www.skills.sh/) or search from the command line:

```powershell
npx skills find QUERY
```

Install one verified community skill with:

```powershell
npx skills add https://github.com/OWNER/REPOSITORY --skill SKILL_NAME
```

Add `--global` only when the skill should be available to every supported agent environment for the current user. Bundled or system skills may already be available and should not be reinstalled merely to document them.

Before installing a third-party skill, inspect its source, publisher, requested tools, dependencies, maintenance, popularity, and available security audits. Do not silently install or update skills during an unrelated task.

## Applying skill output

Treat skill output as analysis, a deliverable, or implementation guidance according to the task. Reconcile it with the current repository and verify important claims and changes. A skill never broadens authorization for destructive actions, external communication, installation, implementation, or unrelated changes.
