# Project layout

**rule-name:** project-layout
**absolute-directory:** `{project-path}\base\project-layout`
**rule-description:**

Apply this optional rule only when creating a new project or when the user explicitly requests that an existing project be restructured.

Select exactly one layout based on the requested project type. Do not combine layouts unless the user explicitly requests a custom structure.

## All

Use this layout when none of the specialized project layouts below match the requested project type, or when the user requests a custom solution structure.

**absolute-path:** `{project-path}\base\project-layout\all.md`

## React Web API with Desktop

Use this layout when the solution requires a React UI, Web API, and Windows Desktop application.

**absolute-path:** `{project-path}\base\project-layout\react-web-api-desktop.md`

## React Web API

Use this layout when the solution requires a React UI and Web API without a Desktop application.

**absolute-path:** `{project-path}\base\project-layout\react-web-api.md`

## Console

Use this layout for a console application without API, Desktop, or UI projects.

**absolute-path:** `{project-path}\base\project-layout\console.md`
