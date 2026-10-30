# UI convention instructions

This file selects UI conventions by concern and framework. Follow the instruction strength and precedence defined in `{project-path}\base\project-conventions\instructions.md`.

## Selection

1. Identify the UI framework from the user's requirements, project context, and established implementation. If a solution contains different UI frameworks, select guidance separately for each affected UI.
2. Identify the concerns the task creates, changes, reviews, or visualizes using the descriptions below.
3. Always read and apply the relevant generic files for those concerns, regardless of framework. Generic conventions are the shared baseline; read only the files relevant to the task.
4. Read and apply the corresponding files for the selected framework when they are listed below. Framework additions supplement the generic baseline and do not replace it.
5. Preserve each convention's applicability conditions. Browser-specific requirements apply to web UIs, API-connected features apply when an API is present, and preferred features depend on the product's needs.
6. If the framework has no listed guidance, apply the relevant generic files and established project patterns. Do not substitute React guidance merely because no dedicated framework directory exists.

## Generic conventions

- **application-experience.md:** Read when creating or changing application identity, metadata, page titles, favicon, the application shell, empty and error states, service status, navigation affordances, theme controls, collection tools, or developer information. Also read when reviewing or visualizing those concerns. `{project-path}\base\project-conventions\instructions\ui\generic\application-experience.md`
- **front-end-design.md:** Read when creating or materially changing a user interface, or when reviewing or visualizing its design. `{project-path}\base\project-conventions\instructions\ui\generic\front-end-design.md`
- **theme.md:** Read when defining, changing, reviewing, or visualizing colors, theme tokens, geometry, elevation, glass, glow, dark mode, or light mode. `{project-path}\base\project-conventions\instructions\ui\generic\theme.md`

## Framework additions

### React

Read the relevant React additions together with their corresponding generic conventions when the affected UI uses React.

- **application-experience.md:** Read for the standard React setup's entry document, metadata placement, favicon, or interface and application-identity asset locations. `{project-path}\base\project-conventions\instructions\ui\react\application-experience.md`
- **front-end-design.md:** Read when selecting, creating, materially changing, reviewing, or visualizing React UI components and their component foundation. `{project-path}\base\project-conventions\instructions\ui\react\front-end-design.md`
- **theme.md:** Read when defining, changing, reviewing, or visualizing React themes and their component-library token integration. `{project-path}\base\project-conventions\instructions\ui\react\theme.md`

## Adding framework guidance

Add a directory for a framework when its conventions are defined, then register its applicable files and read conditions in this file. Keep shared requirements in `generic`; framework files contain only their additions and reference the corresponding generic source. Add only files that contain meaningful framework guidance. Other frameworks do not need placeholder directories or files.
