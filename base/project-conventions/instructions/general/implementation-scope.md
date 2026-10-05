# Implementation scope

These instructions define the default boundaries for where an AI may inspect or change implementation within a project. They govern component-project access, not the technical ability to read or write files.

## Default scope

Front-end projects are in scope by default. An AI may inspect and modify a front-end project as needed to complete the user's current request without requiring the user to name that project separately. In the standard AI Brain layouts, this normally includes the `.UI` project. Apply the same default to another project only when its established responsibility is clearly front-end implementation.

All other component projects are restricted by default. This includes `.Api`, `.Desktop`, `.Domain`, `.Identity`, `.Infrastructure`, `.Test`, and any other project that is not clearly a front-end project. Unless an exception below applies, do not inspect, create, modify, move, rename, or delete files or directories inside a restricted project.

If the user requests implementation work without identifying a component project, limit the work to applicable front-end projects. Do not infer authorization to make a supporting change in a restricted project merely because it would help or complete the front-end work.

## Explicit authorization

The AI may work in a restricted project when the user explicitly identifies that project and requests work within it. The user must name the project, identify a path within it, or otherwise make the intended component unambiguous.

Authorization is limited to the project and work the user identified. Naming one restricted project does not authorize changes to sibling projects. If the requested change would require work in another restricted project, explain the dependency and obtain explicit authorization before accessing that project.

## Project-creation exception

When the user asks to create a project or solution, the AI may create and configure every component project required by the requested solution and the applicable project-creation, layout, structure, and required-file instructions.

This exception applies only to the new project or solution being created. It does not authorize changes to unrelated existing projects.

## Validation exception

When the user requests solution-wide, project-wide, or other explicitly broad validation, the AI may inspect every component included in the requested validation scope. This exception authorizes read-only inspection and the non-mutating validation commands needed to assess that scope.

A validation request does not by itself authorize fixes or other modifications in restricted projects. Modify a restricted project only when the user also explicitly requests remediation in that project or otherwise clearly authorizes implementation there.

## Boundaries

Default access to a front-end project is limited to work relevant to the user's request. It does not authorize unrelated changes, destructive actions, or work outside the current project.

These conventions do not override higher-priority user instructions, repository instructions, environment permissions, or safety requirements. When the requested scope is ambiguous, preserve the restricted projects and ask the user to identify the project that may be accessed.
