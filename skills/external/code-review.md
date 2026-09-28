# Code Review skill

## Purpose

Use Code Review to review changes since a fixed point along two separate axes:

- **Standards:** whether the change follows the repository's documented conventions.
- **Specification:** whether the change implements the originating request, issue, or specification.

Keeping the two reviews separate prevents style concerns from obscuring missed requirements.

## Use when

- reviewing a branch, pull request, commit range, or work-in-progress diff;
- the user asks to review changes since a named branch, tag, commit, or merge base; or
- implementation should be checked independently against standards and specification.

## Invoke

Supply the fixed comparison point:

```text
Use the code-review skill to review the changes since main.
```

Use `$code-review` where direct skill invocation is supported.

## Install

```powershell
npx skills add https://github.com/mattpocock/skills --skill code-review
```

## References

- [skills.sh listing](https://www.skills.sh/mattpocock/skills/code-review)
- [Source repository](https://github.com/mattpocock/skills)

## Preconditions

The fixed point must resolve and the diff must be non-empty. The review should report actionable findings with evidence; it should not mutate the reviewed code unless the user separately asks for fixes.
