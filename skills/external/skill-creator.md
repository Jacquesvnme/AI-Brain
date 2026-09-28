# Skill Creator skill

## Purpose

Use Skill Creator to create a new agent skill or materially improve an existing one. It turns a repeated workflow into a focused `SKILL.md`, supporting references, scripts, assets, and evaluation cases where those additions are useful.

## Use when

- the user asks to create, package, or update an actual agent skill;
- a repeated workflow should become an installable or discoverable skill;
- an existing skill triggers unreliably or produces inconsistent results; or
- the user wants skill evaluations, benchmarks, or iterative human review.

Do not require Skill Creator merely to add a catalogue entry or mention a skill in project documentation. Use it when the actual reusable skill definition or its evaluation suite is being created or changed.

## Invoke

Use `$skill-creator` where direct skill invocation is supported, or say:

```text
Use Skill Creator to turn this repeated workflow into a tested skill.
```

## Core workflow

1. Capture the skill's purpose, triggers, expected output, constraints, and dependencies.
2. Keep the skill focused on a recognizable user goal and place trigger conditions in its description.
3. Write concise main instructions and move optional depth into clearly routed references, scripts, or assets.
4. Create realistic test prompts when the workflow can benefit from evaluation.
5. Compare results, gather human feedback, revise the skill, and repeat until it is reliable.
6. Package or install the skill only when requested.

Subjective design and writing skills may rely more heavily on human review than mechanical assertions. A skill-creation request does not authorize publishing or installing it outside the agreed destination.

## References

- [Build skills with OpenAI](https://developers.openai.com/plugins/build/skills)
- [OpenAI skill concepts](https://developers.openai.com/plugins/concepts/skills)
