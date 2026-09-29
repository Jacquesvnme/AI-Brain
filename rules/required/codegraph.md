# CodeGraph

**rule-name:** codegraph
**absolute-directory:** `{project-path}\.codegraph`
**rule-description:**

Use CodeGraph as the primary method for locating and understanding code.

Apply this rule only when the repository root contains a `.codegraph` directory. Use CodeGraph before grep, file search, or broad source reading when locating code, symbols, or relationships.

Prefer the CodeGraph MCP tool when available; otherwise use `codegraph explore`. If the directory is absent, skip CodeGraph. Do not initialize it unless the user asks.
