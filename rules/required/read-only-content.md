# Read-only content

**rule-name:** read-only-content
**absolute-directory:** `{project-path}`
**writable-directory:** `{project-path}\projects`
**rule-description:**

Treat the AI Brain as a read-only reference. An AI using the AI Brain must not create, modify, move, rename, or delete content anywhere under `{project-path}`, except for project data and files within `{project-path}\projects`.

The `projects` directory is the only writable part of the AI Brain because its project context must remain current as projects change. This exception applies only to content inside that directory; it does not make rules, skills, base guidance, indexes, or other AI Brain content writable.

Within `{project-path}\projects`, modify only the directory that matches the current repository or product. For example, when working on Gamekeeper, update only `{project-path}\projects\gamekeeper`; do not modify any other project's directory or files.
