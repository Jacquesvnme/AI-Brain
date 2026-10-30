# Project upkeep

These instructions define how to create and maintain project context under `{project-path}\projects`.

After the work, update a project-context file only when the completed change materially alters facts that file is responsible for. Keep entries concise, factual, and current; do not add speculative plans or rewrite unchanged documentation.

## Project directory selection and creation

Derive the context-directory name from the established repository or product name. Convert the name to lowercase and replace each run of spaces with a hyphen. For example, `My Project` becomes `my-project`.

Use an existing matching directory instead of creating a differently named duplicate. If no matching directory exists and material project facts need to be recorded, the agent is authorized to create `{project-path}\projects\PROJECT-NAME` using the normalized name. This authorization is limited to context for the current project.

Create only the context files needed to record verified facts under the responsibilities below. Do not create empty placeholder files, copy another project's context, or invent details merely to populate a new directory.

## Project entry files

Use a project entry filename that matches its context-directory name: `projects/wiffy/wiffy.md` for the `wiffy` directory. When creating context for the current project, create its missing entry file alongside the context files needed for verified facts. Preserve an existing populated entry file.

Until fuller documentation is explicitly requested, a newly created entry must contain only the project's top-level Markdown title followed by a newline, for example `# Wiffy`. Use the established title from existing context; if none is documented, use the directory name without inventing a product identity. Do not add descriptions, metadata, navigation, or instructions.

This title-only entry identifies the project and is the sole exception to the prohibition on placeholder context files. All other context files must contain verified, relevant facts. Keep `documentation/main.md` as the separate documentation entry point; do not create missing documentation directories or placeholder documentation files to accompany a project entry.

Entry creation follows the Documentation Mode controls and current-project boundaries in the referenced workflow. An explicitly requested batch of entries across existing projects does not authorize future upkeep across unrelated projects.

## File responsibilities

- **architecture.md:** Briefly describe the system shape, major projects or modules, boundaries, data flow, and recognized architectural patterns. Update when those architectural facts change.
- **backend.md:** Record durable backend behavior, constraints, or conventions unique to the project and not already explained by `architecture.md`. Leave it minimal when nothing project-specific needs documenting.
- **frontend-design.md:** Record the durable front-end direction, layout language, component approach, interaction character, and design principles. Update when the established design direction changes.
- **packages.md:** Keep direct packages and important tooling dependencies current when they are added, removed, replaced, or materially upgraded.
- **pathing.md:** Document controller routes and the front-end-to-back-end path through those controllers. Update when endpoints, route ownership, or integration paths change.
- **themes-and-colors.md:** Keep a short description of the theme choice, palette, semantic color roles, and overall visual treatment. Update only when the established theme changes.
- **documentation/main.md:** Treat this as the project's documentation entry point. Keep its overview and links current whenever project documentation changes.
- **documentation/subdocs/*.md:** Create focused subdocuments as needed for material that would make `main.md` too broad. Link each subdocument from `main.md`, update it when its subject changes, and do not create empty placeholders.
- **other-notes.md:** Do not update unless the user explicitly asks.

## Upkeep boundaries

Do not update project context merely because a file was read, formatted, or touched. Do not duplicate the same detail across several files; keep it in the narrowest responsible document and link to it when another document needs the context. Preserve user-written notes and uncertainty unless the completed work provides verified replacement facts.
