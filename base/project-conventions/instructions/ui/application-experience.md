# Application experience conventions

These instructions define recurring application-wide experience features for visible user interfaces. They apply primarily to React UI projects and should be adapted to another UI technology when the same experience concern exists.

Required features establish the minimum application experience. Preferred features should be included when they fit the product and available data; do not add a control that has no useful behavior merely to satisfy a checklist.

## Application identity and metadata

**Required:** Give every visible application its own identity. Do not ship framework placeholder branding, a default Vite title, or a generic favicon.

The UI project's `index.html` must contain at least:

- the established application name in the document title;
- a concise, product-specific meta description;
- application-name metadata; and
- a link to the custom SVG favicon.

Use this shape and replace every placeholder with real product content:

```html
<title>PROJECT_NAME</title>
<meta name="description" content="PROJECT_DESCRIPTION" />
<meta name="application-name" content="PROJECT_NAME" />
<link rel="icon" type="image/svg+xml" href="/favicon.svg" />
```

Add other metadata when the application needs installability, link previews, mobile presentation, or platform integration. Metadata must describe the actual product and must not expose internal paths, environment details, or secrets.

Create a custom `public/favicon.svg` and keep reusable application-identity artwork under `src/assets/icons`. Display the application icon or an appropriate identity mark in the upper-left area of the application shell when the layout has persistent chrome. The visible identity and favicon should belong to the same visual system.

## Page titles

**Required:** Every page or navigable view must expose a meaningful document title. Use the application name for a single-view application. For multiple views, identify both the current view and the application, using a consistent format such as `View name | Application name`.

Update the title when client-side navigation changes the active view. Do not leave every route with the same generic title, a raw pathname, or a framework default.

## Theme control

**Required:** Support both light and dark themes and provide a visible control that lets the user switch between them. Place the control in persistent application chrome where it remains easy to find, such as the header or sidebar.

Respect the system preference on first use and persist an explicit user selection. Apply the detailed theme behavior in `{project-path}\base\project-conventions\instructions\ui\theme.md`.

## Navigation menu

**Preferred:** Provide a menu control in the upper-left area when the application has multiple primary destinations or when navigation collapses at smaller widths. The control may open a sidebar, drawer, or menu appropriate to the layout.

Do not add an empty menu to a single-purpose screen. Label the control accessibly and make its open, closed, selected, keyboard, and responsive behavior clear.

## Totals and summaries

**Preferred:** Show concise totals where they help users understand a collection, dashboard, filtered result, navigation group, or subsection. Useful examples include total records, visible results, active items, selected items, and category counts.

Keep totals close to the content or control they explain. Recalculate them when filtering changes their meaning, label the scope clearly, and do not invent vanity metrics merely to fill space.

## Search, sorting, and filtering

**Preferred:** Add search, sorting, and filtering when a view contains a meaningful collection or enough data that manual scanning becomes inefficient.

- Search should cover the fields users naturally recognize and should explain its scope through its label or placeholder.
- Sorting should expose useful domain orderings and indicate the active direction.
- Filtering should use meaningful categories or states, show active criteria, and provide a clear way to reset them.
- Result totals should reflect the active search and filters when that distinction helps the user.

Keep these controls together as a coherent collection toolbar when practical. Do not add nonfunctional controls or filters with only one possible value.

## Empty states

**Required:** Design an empty state for every section, collection, dashboard region, table, list, search result, or detail surface that can legitimately contain no data. Do not assume that data will always exist, and do not leave an unexplained blank region when it does not.

An empty state should:

- state clearly that no data is available;
- distinguish an initially empty collection from a search or filter with no matches;
- explain what the user can do next when an action is available;
- provide a relevant primary action, such as creating an item or clearing filters, without inventing an action the product cannot perform; and
- preserve enough layout context that the user understands which section is empty.

Keep loading, empty, error, and populated states distinct. Do not briefly display an empty state while a request is still loading, and do not present an error as though the collection merely contains no records.

## Error feedback

**Required:** Provide one consistent application-level mechanism for presenting errors to the user. Translate technical failures into concise, actionable language and keep exception details, stack traces, internal paths, and sensitive data out of the interface.

Use a dismissible toast notification for recoverable, transient, or background-operation failures. Place the toast consistently in one unobtrusive screen corner, such as the top-left, bottom-left, or bottom-right. Keep it visible for approximately ten seconds by default, pause dismissal while the user is interacting with it, and provide an explicit close button.

Use a modal error dialog when the failure blocks the current workflow, requires acknowledgment, risks data loss, or needs a user decision. A blocking error dialog must not disappear automatically or close on an arbitrary timer. Keep it present until the user selects an explicit action such as `OK`, `Retry`, or `Cancel`; include only actions that have real behavior.

Announce error feedback accessibly, move focus into a blocking dialog, restore focus when it closes, and avoid showing the same failure simultaneously as both a toast and a dialog. Field-level validation should remain next to the affected input instead of being replaced by a generic application notification.

## Service status

**Required:** Every front end connected to an API must display a persistent service-status control in the application shell. Place it in a stable edge or corner location, normally near the bottom of a sidebar or in the upper-left or upper-right application chrome.

The control is a compact button-like block containing a status dot followed by a short text label. It uses these states:

- **Checking:** orange dot with a restrained pulse or wave animation and the text `Checking`;
- **Live:** green dot and the text `Live` after `/status` returns `200 OK` with the expected successful response; and
- **Unavailable:** red dot and the text `Unavailable` after a failed request, non-success status, timeout, or invalid response.

Check the service automatically when the application starts. Clicking the control performs a new check: immediately enter the Checking state, call `GET /status`, and then update the control from the response. Prevent overlapping checks while one is already running.

The dot color is the required visual signal. The label may remain a neutral foreground color or adopt the state color when contrast remains accessible. Do not rely on color alone: retain the text label, expose the current state to assistive technology, and announce state changes through an appropriate live region. Respect reduced-motion preferences by replacing the loading animation with a non-animated Checking treatment.

## Developer information

**Preferred:** Add a developer or about control near the bottom of a persistent left sidebar when that shell exists. The control opens a dialog or popover containing useful technical information about the application, such as:

- the application name, description, and version when available;
- the primary frameworks and UI technology;
- important direct packages or platform integrations;
- a concise description of the solution or front-end structure; and
- relevant local documentation or support information.

Keep the content factual and current. Do not expose secrets, private filesystem paths, credentials, raw environment configuration, or an indiscriminate dump of transitive packages.

## API documentation access

**Preferred:** When the product exposes an API and Swagger or another API-documentation surface is available to the current environment, provide a clearly labeled API documentation control in an appropriate developer, help, or navigation area.

Only show the control when its destination is configured and reachable for that environment. Treat an external destination as a link, indicate when it opens separately, and do not hard-code a development-only URL into a production interface.

## Interaction feedback

**Required:** Interactive controls and selectable content must provide intentional hover feedback on pointer-capable devices, together with visible focus, active, selected, loading, and disabled states where applicable.

Hover treatment should reinforce interactivity through a consistent change in surface, border, color, elevation, or emphasis. Do not move every card or apply decorative animation indiscriminately. Essential information and actions must remain available without hover and on touch devices.

## Applying these features

1. Apply every required feature to a visible UI.
2. Verify loading, empty, error, and populated states for every data-driven section.
3. Verify the service-status control against live, unavailable, malformed-response, and retry scenarios.
4. Evaluate each preferred feature against the product's navigation, data, and available integrations.
5. Include a preferred feature when it provides real utility and can be implemented completely.
6. Omit inapplicable features rather than adding dead, empty, or misleading controls.
7. Verify the experience in both themes, at relevant viewport sizes, and with keyboard navigation.
