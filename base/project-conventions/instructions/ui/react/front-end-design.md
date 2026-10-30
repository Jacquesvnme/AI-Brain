# React front-end design conventions

These instructions supplement `{project-path}\base\project-conventions\instructions\ui\generic\front-end-design.md` for React front ends.

## Component foundation

**Required:** Use shadcn/ui as the component foundation for React front ends, including the React Web API and React Desktop layouts. Start with an applicable shadcn/ui component or primitive instead of creating a custom replacement.

Create a custom component only when shadcn/ui does not provide a suitable foundation or when adapting one of its primitives would make the result less accessible, maintainable, or fit for the product. Record the concrete reason in the implementation or handoff when the choice is not evident from the code. Do not bypass shadcn/ui merely to reproduce a standard button, dialog, menu, popover, form control, table, card, or navigation primitive.

Use shadcn/ui's accessible behavior, semantic token contract, and composable primitives. Treat generated components as owned source code:

- adapt their tokens and variants to the product;
- remove unused variants and dependencies;
- preserve keyboard and screen-reader behavior;
- avoid leaving the default shadcn/ui appearance unchanged; and
- keep custom components compatible with the same theme and interaction language.
