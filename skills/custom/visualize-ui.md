# Visualize UI

Use this instruction to turn a discussed front-end concept into a visual artifact that the user can inspect, interact with where appropriate, critique, and approve before implementation.

This is a design-preview workflow. A request to visualize a UI does not authorize changes to the target application's source code unless the user also asks for implementation.

## Purpose

The visual should confirm that the agent and user understand the same:

- page or component composition;
- theme and color hierarchy;
- spacing and density;
- typography;
- geometry and surface treatment;
- content hierarchy;
- interaction behavior;
- responsive intent; and
- important states such as selected, empty, loading, success, and error.

The user must be able to judge the design by looking at it. A prose description is not a substitute for the visual.

## Required output

Return an actual rendered visual representation. Valid formats include:

- an interactive in-conversation UI visualization;
- interactive HTML with working local interactions;
- a rendered PNG or another raster image;
- an SVG; or
- another format that preserves the intended colors, typography, layout, geometry, and visual hierarchy.

Do not use any of the following as the requested visual deliverable:

- ASCII art;
- a text wireframe;
- a Markdown table;
- a directory tree;
- a Mermaid diagram; or
- prose that only describes where elements would appear.

Text may label content inside the design or briefly explain a decision outside it. It must not replace the rendered design.

## Format selection

Prefer interactive HTML or an in-conversation interactive visualization for application shells, pages, dialogs, navigation, forms, dashboards, and components whose hover, focus, selection, expansion, or responsive behavior matters.

Use PNG or another raster format when the goal is a fixed visual composition, mood treatment, or high-fidelity snapshot and interaction would not improve the review.

Use SVG for scalable static interface concepts, diagrams that depend on real shape and color, or focused component visuals. Do not use SVG merely to disguise a text wireframe.

When Codex provides a native interactive visualization surface, use it for in-conversation review. Use the installed Visualize skill when available. Read `{project-path}\skills\external\visualize.md` for its role and then follow the active skill's `SKILL.md`. The final result should appear where the user can inspect it without reconstructing it from code.

Use ImageGen when a static raster mockup is the most useful review artifact, especially for composition, color, mood, artwork, or polished visual direction. Read `{project-path}\skills\external\imagegen.md` before selecting this path. Do not use ImageGen as a substitute for inspectable interaction, responsive behavior, or implementation-ready UI source.

## Inputs and context

Before creating the visual, gather the smallest set of information needed from the conversation and project:

- the screen, page, section, flow, or component being visualized;
- the user's goal for that surface;
- the content and actions it must contain;
- the target platform and expected viewport;
- the applicable theme and front-end design conventions;
- existing product chrome or component patterns that should be preserved; and
- unresolved choices that the visualization should help decide.

Use information already established in the conversation. Do not ask the user to repeat decisions that are already clear.

For an existing product, match its navigation, typography, palette, component language, density, and terminology. For a new product, apply the project theme and front-end design conventions before choosing the visual direction.

## Design requirements

The visualization must contain realistic content and the actual controls needed to understand the concept. Avoid placeholder dashboards, filler cards, arbitrary metrics, and generic marketing copy.

Apply the shared conventions in:

- `{project-path}\base\project-conventions\instructions\ui\application-experience.md`
- `{project-path}\base\project-conventions\instructions\ui\theme.md`
- `{project-path}\base\project-conventions\instructions\ui\front-end-design.md`
- `{project-path}\skills\external\frontend-design.md`

The visual must make these decisions inspectable:

- primary and secondary regions;
- navigation and action placement;
- selected and active states;
- surface hierarchy;
- border radius or sharp-corner language;
- primary, neutral, and semantic colors;
- typography scale and alignment;
- spacing rhythm;
- imagery or icon treatment; and
- desktop-to-mobile reflow when responsiveness is part of the concept.

Do not default to the same card grid, oversized hero, gradient decoration, or rounded SaaS layout for unrelated products. The result should fit the product being discussed.

## Interaction requirements

When the selected format supports interaction, implement the interactions that affect design review. These may include:

- hover, focus, pressed, and selected states;
- tabs and navigation changes;
- opening and closing dialogs or drawers;
- expanding and collapsing content;
- theme switching;
- choosing between meaningful design variants; and
- narrow and wide layout demonstrations.

Controls shown as interactive must respond. Do not include dead buttons solely for decoration. Keep interactions local to the preview; they must not call production APIs, mutate project data, or perform external actions.

The initial state must already communicate the design. Hover-only details cannot contain essential content.

## Variants

Show a small number of variants when a real design choice remains unresolved and comparing them will help the user decide. Variants should differ in a meaningful dimension such as composition, density, geometry, or emphasis.

Do not generate several cosmetic variations with no clear decision behind them. When the direction is already established, produce one strong design and refine it through feedback.

## Accessibility and responsiveness

Interactive previews must use keyboard-accessible controls, visible focus states, readable contrast, semantic structure, and labels for icon-only actions. Respect reduced-motion preferences when motion is present.

Support the viewport sizes relevant to the concept. A desktop application shell should be inspectable at desktop width. A responsive web page should also show or support its mobile composition. Reflow the design rather than shrinking it until text and controls become unreadable.

## Review cycle

1. Restate the visual scope only when the requested surface is ambiguous.
2. Create the rendered visual using the applicable project context and conventions.
3. Present the visual in the conversation or another directly inspectable format.
4. Let the user critique layout, theme, content, and interactions.
5. Revise the same concept so changes remain easy to compare.
6. Treat explicit approval as approval of the design, not automatic permission to implement it in the project.

If implementation follows, use the approved visual as the design reference and preserve its intentional hierarchy, states, and responsive behavior.

## Completion criteria

The visualization is complete when:

- it is rendered rather than described;
- it shows the requested UI scope with realistic content;
- its colors, typography, geometry, spacing, and layout are visible;
- review-relevant interactions work when interaction was requested or selected;
- essential states and responsive behavior are represented where applicable;
- the user can identify concrete changes to request; and
- no project implementation was changed without authorization.
