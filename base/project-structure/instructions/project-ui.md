# UI Project

The UI project is the JavaScript- or TypeScript-based front end. The standard React Web API layout uses React, TypeScript, and Vite, but the exact tooling may differ when another front-end framework is selected.

The authored source should favor reusable components and a modular structure. Detailed front-end implementation choices may be made as needed when they are not covered by these instructions or an explicit user requirement.

Replace `PROJECT_NAME` with the actual project name throughout the structure.

## Expected structure

```text
PROJECT_NAME.UI/
├── public/
│   └── favicon.svg
├── src/
│   ├── assets/
│   │   └── icons/
│   ├── layout/
│   ├── sections/
│   ├── shared/
│   │   ├── api/
│   │   ├── data/
│   │   ├── hooks/
│   │   ├── lib/
│   │   └── ui/
│   ├── styles/
│   │   ├── buttons.css
│   │   ├── dialogs.css
│   │   ├── global.css
│   │   ├── layout.css
│   │   └── theme.css
│   ├── App.tsx
│   └── main.tsx
├── .gitignore
├── components.json
├── eslint.config.js
├── index.html
├── package.json
├── package-lock.json
├── tsconfig.app.json
├── tsconfig.json
├── tsconfig.node.json
├── vite.config.ts
└── PROJECT_NAME.UI.esproj
```

File names may differ when the selected framework, package manager, or build tool requires different standard configuration.

## Source structure

### Entry files

`main.tsx` is the browser entry point and starts the front-end application. `App.tsx` is the root application component and composes the primary layout and sections.

The root `index.html` is the application HTML entry document. It contains the application name, description, page-title default, favicon link, and other required document metadata defined by `{project-path}\base\project-conventions\instructions\ui\application-experience.md`.

### Assets

The `src/assets` directory contains authored assets that are imported by front-end source code and processed by the build tool.

Store locally maintained interface and application-identity SVG files under `src/assets/icons`. Use this directory as the single source for icons rendered by React components. Organize a large icon set into focused subdirectories without scattering SVG files across feature, layout, or component directories.

SVG is the required source format for interface icons. Do not add remote icon URLs or raster replacements when an SVG can represent the icon. When a target platform requires a generated raster derivative, retain the local SVG as the authoritative source.

### Layout

The `layout` directory contains the main application layout or layouts. Place shared page shells and structural composition used across multiple views in this directory.

### Sections

The `sections` directory contains feature-level or page-level components. Separate components by responsibility and keep substantial functionality in its own file rather than allowing a single component to absorb unrelated behavior.

### Shared

The `shared` directory contains reusable front-end functionality:

- `api` contains API clients, transport helpers, and related types;
- `data` contains reusable static or catalog data;
- `hooks` contains reusable React hooks;
- `lib` contains reusable non-visual logic; and
- `ui` contains the installed and product-adapted shadcn/ui component source together with reusable visual components built on those primitives.

Use these divisions to support componentization, reusability, and a modular front-end architecture.

### Styles

The `styles` directory contains CSS grouped by purpose. Prefer focused files such as `buttons.css` and `dialogs.css` for element or feature-specific styling.

- `theme.css` defines application colors and theme variables.
- `global.css` is the high-level stylesheet and import point for shared styles.
- `layout.css` contains styling for primary application layouts.

Add further focused style files when their responsibilities are distinct.

## Public assets

The `public` directory contains static files that must retain stable public URLs. Add a custom `favicon.svg` for every visible application UI and reference it from `index.html`. Do not retain the framework's default favicon or placeholder branding.

Reusable interface icons belong under `src/assets/icons`, not `public`. Add another public asset only when it must be served without module import or build-time processing.

## Package and build configuration

`package.json` defines front-end dependencies and scripts. It must provide the applicable development and production build commands, normally `npm run dev` and `npm run build` for the standard React and Vite setup.

`components.json` configures the shadcn CLI and its import aliases. Point its `ui`, `lib`, `hooks`, and related aliases at the corresponding directories under `src/shared`, and keep those aliases synchronized with the TypeScript and Vite alias configuration. Preserve this file when adding or updating shadcn/ui components through the CLI.

Preserve the lockfile for the selected package manager, such as `package-lock.json` for npm or `pnpm-lock.yaml` for pnpm. Use one package manager consistently within a project.

TypeScript, ESLint, Vite, `.esproj`, and related configuration files may be changed when needed to support the application and its tooling. No additional project-specific restrictions are currently defined for those files.

## Generated directories

`node_modules` is generated by the package manager and is not managed as project source.

`dist` is generated by the production build. It may contain compiled assets and a generated `index.html`, but it is build output rather than the authoritative location for source files or static assets. Do not manually maintain generated `dist` content as part of the project structure.
