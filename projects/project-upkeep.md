# Project upkeep

Use these instructions only when the current repository or product has a matching directory under `{project-path}\projects`. Do not read or update another project's context.

Before relevant work, read `{project-path}\projects\instructions.md` and only the matching project files needed for the task. After the work, update a project-context file only when the completed change materially alters facts that file is responsible for. Keep entries concise, factual, and current; do not add speculative plans or rewrite unchanged documentation.

## File responsibilities

- **architecture.md:** Briefly describe the system shape, major projects or modules, boundaries, data flow, and recognized architectural patterns. Update when those architectural facts change.
- **backend.md:** Record durable backend behavior, constraints, or conventions unique to the project and not already explained by `architecture.md`. Leave it minimal when nothing project-specific needs documenting.
- **frontend-design.md:** Record the durable front-end direction, layout language, component approach, interaction character, and design principles. Update when the established design direction changes.
- **packages.md:** Keep direct packages and important tooling dependencies current when they are added, removed, replaced, or materially upgraded.
- **pathing.md:** Document controller routes and the front-end-to-back-end path through those controllers. Update when endpoints, route ownership, or integration paths change.
- **themes-and-colors.md:** Keep a short description of the theme choice, palette, semantic color roles, and overall visual treatment. Update only when the established theme changes.
- **documentation/main.md:** Treat this as the project's documentation entry point. Keep its overview and links current whenever project documentation changes.
- **documentation/subdocs/*.md:** Create focused subdocuments as needed for material that would make `main.md` too broad or expensive to load. Link each subdocument from `main.md`, update it when its subject changes, and do not create empty placeholders.
- **other-notes.md:** Do not update unless the user explicitly asks.

## Upkeep boundaries

Do not update project context merely because a file was read, formatted, or touched. Do not duplicate the same detail across several files; keep it in the narrowest responsible document and link to it when another document needs the context. Preserve user-written notes and uncertainty unless the completed work provides verified replacement facts.
