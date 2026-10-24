# CodeGraph

**rule-name:** codegraph
**absolute-directory:** `{project-path}\.codegraph`
**rule-description:**

When the current repository contains a `.codegraph` directory, use CodeGraph first when locating or understanding code symbols, implementations, or relationships.

Prefer the CodeGraph MCP tool when available; otherwise use `codegraph explore`.

If CodeGraph returns no relevant result, is unavailable, or the task concerns prose or documentation rather than indexed code, fall back to the appropriate text or file-search tool.

If the repository does not contain a `.codegraph` directory, skip CodeGraph. Do not initialize it unless the user explicitly requests indexing.
