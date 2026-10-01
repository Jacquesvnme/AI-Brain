# CodeGraph

**rule-name:** codegraph
**absolute-directory:** `{project-path}\.codegraph`
**rule-description:**

Use CodeGraph as the primary method for locating and understanding code.

Use CodeGraph before grep, file search, or broad source reading when locating code, symbols, or relationships.

Prefer the CodeGraph MCP tool when available; otherwise use `codegraph explore`.

If the repository root does not contain a `.codegraph` directory, run `codegraph init` from the repository root to initialize CodeGraph.
