# Theme conventions

These instructions define the preferred approach to application themes. They describe a visual system, not a fixed palette that every application must copy.

## Design intent

Themes should feel minimal, deliberate, cohesive, and product-specific. Prefer a restrained neutral foundation with one clearly dominant color family. Bright, neon, or highly saturated accents are welcome when they are controlled by hierarchy rather than spread across every element.

The established preference is compatible with glassmorphism, restrained retro-futurism, cyberpunk influence, organic forms, and bento composition. These are influences, not mandatory presets. Choose only the influences that fit the product's subject and audience.

Do not make every application visually identical. ModLedger, Portfolio, and Game Keeper use different accent colors and different geometry while sharing the same discipline: compact palettes, clear hierarchy, intentional surfaces, and consistent internal rules.

## Palette architecture

Build the palette from semantic roles rather than component-specific color names.

Every theme should define:

- page and application-shell backgrounds;
- base, raised, interactive, and overlay surfaces;
- primary and muted foreground text;
- default and strong borders;
- input and focus-ring colors;
- one primary accent family;
- semantic success, warning, danger, and information colors;
- shadow, overlay, and ambient-glow colors; and
- accessible foreground colors for filled accent and semantic surfaces.

Prefer one of these palette models:

1. One primary accent plus neutral colors.
2. One primary, one secondary, and one tertiary accent plus neutral colors.

The first model is the default. Use secondary and tertiary accents only when they encode a genuine distinction, such as categories, data series, or separate product functions. They must not compete equally for attention.

For dark themes, prefer very dark chromatic foundations related to the primary hue when appropriate. A green product may use near-black green backgrounds; a purple product may use near-black violet backgrounds. Pure neutral black or gray remains valid when a chromatic foundation would distort content or imagery.

For light themes, design a complete counterpart rather than mechanically inverting the dark palette. Preserve hierarchy, contrast, and product identity while reducing heavy shadows and excessive glow.

## Token requirements

Store theme decisions in a centralized token layer. Components must consume semantic tokens rather than repeating raw color values.

Prefer perceptually consistent color spaces such as OKLCH when the toolchain supports them. Hex and RGB remain acceptable for compatibility. Regardless of syntax, name tokens by purpose:

```css
:root {
  --background: ...;
  --surface: ...;
  --surface-raised: ...;
  --surface-hover: ...;
  --foreground: ...;
  --foreground-muted: ...;
  --border: ...;
  --border-strong: ...;
  --primary: ...;
  --primary-foreground: ...;
  --primary-soft: ...;
  --ring: ...;
  --success: ...;
  --warning: ...;
  --danger: ...;
  --shadow: ...;
  --ambient-glow: ...;
  --radius: ...;
}
```

Avoid names such as `--purple`, `--card-blue`, or `--header-gray` when the value represents a reusable semantic role. Component aliases may reference semantic tokens when a component needs a stable public contract.

When using ShadCN UI, retain its semantic token contract and map the product palette into those tokens. Extend the token system instead of bypassing it with scattered arbitrary colors.

## Geometry and borders

Choose a geometry language once for each application:

- compact radii or nearly square corners for technical, dense, or terminal-influenced products;
- moderate radii for neutral application interfaces; or
- more generous radii for softer, editorial, or organic products.

Apply that choice consistently to cards, fields, dialogs, buttons, menus, and navigation. A small token scale is acceptable, but radius differences must express hierarchy or component function. Do not mix pill-shaped, sharply squared, and heavily rounded containers without a deliberate system.

Use borders to define structure, selection, and focus. Subtle one-pixel borders are preferred over heavy outlines. Strengthen or color a border for active, selected, focused, or destructive states rather than decorating every surface equally.

## Glass, translucency, and elevation

Glass effects are preferred when they support layering, atmosphere, or persistent chrome. A convincing glass surface needs:

- a translucent surface color;
- enough backdrop blur to separate layers;
- a visible but restrained edge;
- a shadow or ambient glow appropriate to the theme; and
- readable content over every background that can appear behind it.

Do not turn every card into glass. Reserve glass for elements such as headers, overlays, dialogs, floating controls, or a small number of signature surfaces. Static content panels can use solid or lightly translucent surfaces.

Treat shadows and glows separately. Shadows communicate elevation; glows communicate emphasis or atmosphere. Prefer a few broad, low-opacity ambient glows and small focused glows for active elements. Avoid uniform neon halos around every control.

## Dark and light modes

Support dark and light modes when the product benefits from both. Dark mode is often the stronger expression of the preferred aesthetic, but light mode must remain a first-class design rather than an afterthought.

Theme selection should:

- respect the system preference on first use unless the product requires another default;
- persist an explicit user choice;
- update the document color scheme and browser theme color;
- synchronize embedded desktop chrome when a web UI is hosted in a desktop shell; and
- avoid a flash of the wrong theme during startup where practical.

## Contrast and accessibility

Neon color does not excuse weak contrast. Check text, icons, focus rings, borders, disabled states, and semantic states in both themes. Muted text must still be readable. Never communicate success, warning, error, or selection by color alone.

Focus indicators should use the accent family and remain visible against every surface. Respect forced-colors modes where relevant.

## Theme review

Before considering a theme complete:

1. Inspect the full token set rather than isolated components.
2. Compare default, hover, active, selected, focused, disabled, loading, success, and error states.
3. Review dark and light modes independently.
4. Check representative screens containing navigation, forms, data, dialogs, and empty states.
5. Confirm the palette has a clear dominant color and does not become a collection of equally loud accents.
6. Confirm radius, border, shadow, and glow decisions are consistent across the application.
7. Capture and inspect screenshots at desktop and mobile sizes when the environment permits it.
