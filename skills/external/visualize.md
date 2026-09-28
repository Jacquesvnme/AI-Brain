# Visualize skill

## Purpose

Use Visualize to create an interactive, in-conversation visual when direct manipulation or spatial presentation will communicate the result better than prose. It supports UI mockups, charts, diagrams, explainers, simulations, maps, timelines, and other inspectable visual artifacts.

## Use when

- the user asks to visualize a concept or interact with it;
- a UI mockup should be reviewed directly in the conversation;
- relationships, state changes, comparisons, or sequences are difficult to understand in prose; or
- a chart, diagram, map, or simulation materially improves the answer.

Do not use it merely to decorate a simple answer. Use ImageGen instead when the intended output is a generated bitmap rather than an interactive or code-native visual.

## Visualize UI relationship

Visualize is the preferred execution skill for interactive output under `{project-path}\skills\custom\visualize-ui.md`. The custom workflow defines the user's review expectations and design boundaries; the installed skill defines how to build and return the in-conversation artifact.

## Invoke

Use `$visualize` where direct skill invocation is supported, or say:

```text
Use Visualize to create an interactive UI mockup for review.
```

Read the active `SKILL.md` before creating the artifact. Its host-specific output contract, accessibility rules, supported libraries, and design utilities govern the implementation of the visualization.
