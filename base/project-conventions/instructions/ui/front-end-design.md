# Front-end design conventions

These instructions define the preferred design process and visual character for user interfaces. They apply to new interfaces and to material redesigns of existing interfaces. For small changes, preserve the established product language unless the user requests a redesign.

## Reference priority

Use the following references as read-only evidence of established preferences:

1. **ModLedger:** `C:\~ My Files\Application-Collection\ModLedger` — primary reference for current design judgment, compact application shells, dense information, restrained neon emphasis, and consistent near-square geometry.
2. **Portfolio:** `C:\~ My Files\Application-Collection\Portfolio` and [jacquesvanniekerk.com](https://jacquesvanniekerk.com) — reference for a more spacious composition, green-led atmosphere, ambient backgrounds, editorial hierarchy, and responsive presentation.
3. **Game Keeper:** `C:\~ My Files\Application-Collection\AppManager` — secondary reference for dashboard composition, shadcn/ui-based controls, image-led cards, detail panels, and light/dark theme parity. Learn from its visual treatment, but do not copy its project structure.

Never edit a reference project while applying these instructions unless the user explicitly asks to modify that project. Extract principles rather than copying screens or assuming one reference is a universal template.

## Required design process

Before implementation, establish a compact design brief containing:

- the product's subject, audience, and primary task;
- one sentence describing the desired visual character;
- a semantic color-token plan;
- typography and density choices;
- the layout model and responsive behavior;
- the application's geometry language; and
- the one visual idea that should make the product memorable.

Use the installed `frontend-design` skill when it is available and the task creates a new UI or materially reshapes an existing one. Read its catalogue entry at `{project-path}\skills\external\frontend-design.md` and then follow the active skill's `SKILL.md`. The skill supplements these conventions; explicit user preferences and project context still take precedence.

When the user requests a design preview before implementation, follow `{project-path}\skills\custom\visualize-ui.md`. Use the Visualize skill for interactive in-conversation review or ImageGen for a static raster concept when that format better serves the decision.

Review the proposed direction before coding. If it could be reused unchanged for an unrelated product, it is not specific enough. Revise the palette, composition, typography, imagery, or signature element until it belongs to the product.

## Visual character

The default preference is modern minimalism with controlled atmosphere:

- one dominant primary color family, often bright or neon;
- neutral or primary-tinted foundations;
- disciplined use of glow, translucency, and ambient gradients;
- clean composition with visible hierarchy;
- compact, purposeful controls;
- minimal decoration without becoming visually sterile; and
- internally consistent geometry, spacing, and density.

Retro-futuristic, cyberpunk, glassmorphic, neo-brutalist, organic, and bento influences are acceptable. Use them as a coherent supporting language chosen for the product—not as a checklist of effects.

Spend visual boldness in one or two places. A luminous active state, atmospheric background, distinctive information layout, or strong imagery can carry the identity. Keep surrounding elements quieter.

## Component foundation

**Required:** Use shadcn/ui as the component foundation for React front ends, including the React Web API and React Desktop layouts. Start with an applicable shadcn/ui component or primitive instead of creating a custom replacement.

Create a custom component only when shadcn/ui does not provide a suitable foundation or when adapting one of its primitives would make the result less accessible, maintainable, or fit for the product. Record the concrete reason in the implementation or handoff when the choice is not evident from the code. Do not bypass shadcn/ui merely to reproduce a standard button, dialog, menu, popover, form control, table, card, or navigation primitive.

Use shadcn/ui's accessible behavior, semantic token contract, and composable primitives. Treat generated components as owned source code:

- adapt their tokens and variants to the product;
- remove unused variants and dependencies;
- preserve keyboard and screen-reader behavior;
- avoid leaving the default shadcn/ui appearance unchanged; and
- keep custom components compatible with the same theme and interaction language.

**Required:** Use SVG for interface icons and store the SVG source locally under the UI project's `src/assets/icons` directory. Do not depend on remotely hosted icon files. When an icon originates from Lucide or another approved icon set, add the selected SVG asset to the local icon directory rather than introducing inconsistent icon sources throughout the component tree.

Keep icon stroke or fill treatment, view boxes, sizing, and alignment consistent. Icons should clarify actions or categories; they should not be scattered as decoration. Provide accessible labels for icon-only controls and treat decorative SVGs as hidden from assistive technology.

Application identity, favicon, metadata, page-title, application-shell, and common experience-feature requirements are defined in `{project-path}\base\project-conventions\instructions\ui\application-experience.md`.

## Layout and composition

Design around the user's primary workflow. Application interfaces may use a strong shell with header, navigation, content workspace, and contextual detail region. Marketing, portfolio, and editorial pages may use a more fluid narrative structure.

Bento layouts are welcome when each region communicates a distinct piece of information and the composition creates meaningful visual hierarchy. Do not turn every paragraph or metric into an interchangeable rounded card.

Prefer a few strong regions over many nested containers. Use spacing, alignment, borders, background shifts, and typography before introducing another card. Repeated items such as collections, search results, games, or projects may use cards when the boundary helps comparison or selection.

Keep primary actions near the content they affect. Secondary and destructive actions should be visually quieter until needed. Detail panels should support the selected content rather than repeat every fact already visible in the list.

## Typography and content

Choose typography deliberately. A single well-used family is acceptable; two families should have clearly different roles. Define a restrained type scale and use weight, size, line height, and spacing consistently.

Avoid generated-interface typography habits unless the content genuinely calls for them:

- an all-caps eyebrow above every heading;
- one highlighted word in every headline;
- monospace labels used only to look technical;
- numbered section markers for content that is not sequential; and
- excessive letter spacing on small labels.

Interface copy must be concise and operational. Use sentence case, active voice, and the user's vocabulary. Buttons should name the resulting action, such as `Save changes` or `Open folder`, rather than generic labels such as `Submit` or `Continue`.

Empty, loading, error, and success states are part of the design. Explain what happened and what the user can do next. Avoid vague errors and decorative placeholder copy.

## Interaction and motion

Every interactive element needs recognizable default, hover, focus, active, selected, loading, and disabled states where applicable. Selection should be more evident than hover. Destructive actions must remain visually distinct without dominating the default screen.

Use motion to explain change, establish one intentional entrance, or provide feedback. Avoid applying the same fade-and-slide animation to every section or lifting every card on hover. Respect `prefers-reduced-motion` and ensure that disabling motion does not hide state changes.

## Responsiveness

Design desktop and mobile composition deliberately. Do not treat mobile as a scaled-down desktop canvas.

- Collapse navigation into a usable, labeled control.
- Reorder regions according to task priority.
- Convert multi-column detail views into a clear reading sequence.
- Keep touch targets comfortable and preserve visible focus behavior.
- Avoid horizontal overflow except for intentional data views with an accessible scrolling affordance.
- Test narrow mobile, ordinary laptop, and wide desktop layouts.

## Accessibility quality floor

Every interface must provide:

- semantic HTML and appropriate landmarks;
- keyboard access to all actions;
- visible focus states;
- labels for icon-only controls;
- sufficient text and control contrast;
- non-color cues for status and selection;
- reduced-motion support; and
- appropriate dialog, menu, popover, and disclosure behavior.

Accessibility is part of the design system, not a later polish step.

## Avoiding generic AI-generated UI

Avoid converging on the same fashionable defaults without a product-specific reason:

- identical rounded cards for every content type;
- a dark page with an arbitrary acid accent;
- decorative gradient blobs with no relationship to the brand;
- excessive glass, glow, shadows, or border radii;
- a hero composed only of a huge headline, short subtitle, two buttons, and floating cards;
- repeated badges, pills, and eyebrow labels used as filler; and
- generic marketing claims in place of real product content.

The preferred neon-dark aesthetic is itself capable of becoming generic. Ground the color, imagery, spacing, and signature interaction in the actual subject so that the result does not merely look like a reusable cyberpunk dashboard template.

## Visual verification

After implementation:

1. Run the front-end build and relevant automated checks.
2. Open the actual interface with representative content.
3. Capture screenshots at meaningful desktop and mobile sizes.
4. Compare the result with the design brief and theme tokens.
5. Check hierarchy, alignment, overflow, contrast, geometry, and interaction states.
6. Remove one unnecessary decorative treatment if the interface feels visually busy.
7. Repeat until the screenshots look intentional rather than merely functional.
