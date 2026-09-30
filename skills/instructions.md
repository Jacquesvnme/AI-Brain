# Skill instructions

This directory is the central catalogue for reusable agent workflows used with the AI Brain. It keeps workflow capabilities separate from project conventions: conventions describe the desired project result, while skills describe a repeatable way for an agent to perform a task.

The catalogue documents when a skill applies, how it relates to other guidance, and where it came from. These files do not replace an installed skill's `SKILL.md`. When a skill is available, read and follow its active `SKILL.md` before using it because the installed workflow may change independently of this catalogue.

Use this file as the catalogue router.

## Directory structure

- `custom` contains reusable workflows authored for the user and the AI Brain. They may be activated through a rule even when they are not packaged as an agent skill.
- `external` contains skills supplied outside this repository, including bundled OpenAI skills and community skills installed from public repositories.

`External` describes provenance, not quality or trust. Inspect the active skill and its source before installation or use. Do not call this directory `generic`: several entries are highly specialized, and the useful distinction is whether the workflow is maintained here or obtained elsewhere.

## Custom workflows

- **visualize-ui.md:** Produce a rendered UI concept for critique and approval. `{project-path}\skills\custom\visualize-ui.md`

## External skill catalogue

- **code-review.md:** Review a diff separately against repository standards and the originating specification. `{project-path}\skills\external\code-review.md`
- **codebase-design.md:** Use deep-module vocabulary to design interfaces, seams, adapters, and testable modules. `{project-path}\skills\external\codebase-design.md`
- **find-skills.md:** Discover and evaluate installable skills. `{project-path}\skills\external\find-skills.md`
- **frontend-design.md:** Create distinctive, product-specific user interfaces. `{project-path}\skills\external\frontend-design.md`
- **grilling.md:** Stress-test a plan or design through structured questioning. `{project-path}\skills\external\grilling.md`
- **humanizer.md:** Revise formulaic prose without changing its meaning. `{project-path}\skills\external\humanizer.md`
- **imagegen.md:** Generate or edit raster images, including static UI mockups and supporting visual assets. `{project-path}\skills\external\imagegen.md`
- **improve-codebase-architecture.md:** Find architectural friction and propose module-deepening refactors. `{project-path}\skills\external\improve-codebase-architecture.md`
- **openai-docs.md:** Retrieve current, cited guidance from official OpenAI documentation. `{project-path}\skills\external\openai-docs.md`
- **skill-creator.md:** Create, test, evaluate, and improve reusable agent skills. `{project-path}\skills\external\skill-creator.md`
- **visualize.md:** Create interactive, in-conversation visualizations and UI mockups. `{project-path}\skills\external\visualize.md`

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
