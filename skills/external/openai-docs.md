# OpenAI Docs skill

## Purpose

Use OpenAI Docs to answer questions about OpenAI products with current, cited information from official documentation. Its scope includes Codex, ChatGPT Work, models, pricing, settings, skills, plugins, APIs, SDKs, prompting, agents, evals, automation, and troubleshooting.

## Use when

- the user asks how Codex, ChatGPT Work, or an OpenAI API feature currently behaves;
- model availability, pricing, limits, settings, or product capabilities may have changed;
- implementation depends on a current OpenAI API or SDK contract; or
- the user requests official OpenAI citations.

Do not invoke it for an ordinary software task merely because Codex is being used to perform the work.

## Invoke

Use `$openai-docs` where direct skill invocation is supported, or say:

```text
Use OpenAI Docs to answer this from current official documentation.
```

## Source requirements

Search and open the exact relevant official page before answering. Use only official OpenAI documentation domains allowed by the active skill, cite the supporting pages, preserve explicitly requested model names, and state uncertainty when the documentation does not establish an answer.

Read the active skill before use because its approved domains and routing instructions may change.

## References

- [OpenAI skill concepts](https://developers.openai.com/plugins/concepts/skills)
- [OpenAI API skills guide](https://developers.openai.com/api/docs/guides/tools-skills)
