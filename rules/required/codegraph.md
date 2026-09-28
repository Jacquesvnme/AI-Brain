# CodeGraph

**rule-name:** CodeGraph
**absolute-directory:** `{project-path}\.codegraph`
**rule-description:**

Use CodeGraph as the primary method for locating and understanding code.

For every code repository:

1. Check the repository root for a `.codegraph` directory.
2. If `.codegraph` does not exist, run the following command from the repository root:

```powershell
codegraph init .
```
