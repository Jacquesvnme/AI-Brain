# Humanizer skill

## Purpose

Use Humanizer to revise prose that sounds formulaic, inflated, repetitive, vague, or chatbot-generated while preserving its meaning and factual content. It is based on documented patterns associated with AI-generated writing.

## Use when

- polishing README files, documentation, release notes, articles, or interface copy;
- reviewing prose for excessive headings, filler, repetition, vague attribution, or sales language;
- matching an existing human voice from a supplied writing sample; or
- the user asks to humanize text.

Do not use it to disguise authorship, fabricate personal experience, alter quotations, or weaken the precision of technical reference material.

## Invoke

Use `$humanizer` or `/humanizer` where supported, or say:

```text
Use the humanizer skill to revise this prose without changing its meaning.
```

Provide a writing sample when the result should match a particular voice.

## Install

Project-local installation:

```powershell
npx skills add blader/humanizer
```

User-level installation:

```powershell
npx skills add blader/humanizer --global
```

## References

- [skills.sh listing](https://www.skills.sh/blader/humanizer)
- [Source repository](https://github.com/blader/humanizer)
