# ImageGen skill

## Purpose

Use ImageGen to generate or edit raster images when a bitmap is the intended deliverable. Suitable outputs include illustrations, product imagery, textures, visual assets, mood treatments, and static UI mockups.

## Use when

- the user requests a new raster image or an edit to an existing image;
- a static, high-fidelity UI composition is more useful than an interactive preview;
- a front-end concept needs supporting artwork, a hero image, texture, or product imagery; or
- the user wants image variants based on visual references.

Do not use ImageGen for an interface whose interactions need to be reviewed, for a repo-native SVG or icon system, or when deterministic HTML, CSS, canvas, or vector source is the intended result.

## Visualize UI relationship

ImageGen is one possible rendering path for `{project-path}\skills\custom\visualize-ui.md`. Use it when the requested review is primarily about static composition, color, mood, or visual polish. Prefer the Visualize skill or interactive HTML when hover, focus, navigation, dialogs, responsive behavior, or state changes need to be inspected.

An ImageGen mockup is design evidence, not implementation-ready source code. Do not imply pixel-perfect component behavior from a generated bitmap.

## Invoke

Use `$imagegen` where direct skill invocation is supported, or say:

```text
Use ImageGen to create a static visual mockup of this interface.
```

Provide the intended use, target aspect ratio or viewport, required content, theme, composition, exact text, constraints, and any reference images. Preserve existing image invariants when editing.

## Source and execution notes

ImageGen is available as a bundled OpenAI skill in supported Codex environments. Read the active `SKILL.md` before use. Prefer the built-in image-generation tool; use an API or CLI fallback only when the user explicitly requests that route and its requirements are satisfied.

- [Official OpenAI image-generation guide](https://developers.openai.com/api/docs/guides/image-generation)
