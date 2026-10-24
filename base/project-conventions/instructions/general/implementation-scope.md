# Implementation scope

These instructions define the default boundaries for inspecting and modifying implementation within a project. Inspection is broadly allowed so the AI can understand the system; modification remains limited by component-project scope.

## Inspection scope

The AI may inspect every component project when relevant to understanding, diagnosing, planning, reviewing, or validating the user's request. This includes front-end, API, Desktop, Domain, Identity, Infrastructure, Test, and other component projects.

Inspection does not authorize modification. Keep read-only investigation relevant to the current request and do not use broad access as a reason to inspect unrelated parts of the repository.

## Default modification scope

Front-end projects are in modification scope by default. An AI may modify a front-end project as needed to complete the user's current request without requiring the user to name that project separately. In the standard AI Brain layouts, this normally includes the `.UI` project. Apply the same default to another project only when its established responsibility is clearly front-end implementation.

All other component projects are restricted from modification by default. This includes `.Api`, `.Desktop`, `.Domain`, `.Identity`, `.Infrastructure`, `.Test`, and any other project that is not clearly a front-end project. Unless an exception below applies, do not create, modify, move, rename, or delete files or directories inside a restricted project.

If the user requests implementation work without identifying a component project, limit the work to applicable front-end projects. Do not infer authorization to make a supporting change in a restricted project merely because it would help or complete the front-end work.

## Explicit authorization

The AI may modify a restricted project when the user explicitly identifies that project, names the relevant layer or path, or otherwise unambiguously requests changes within it.

Authorization is limited to the project and work the user identified. Naming one restricted project does not authorize changes to sibling projects. If the requested change would require work in another restricted project, explain the dependency and obtain explicit authorization before modifying that project.

## Project-creation exception

When the user asks to create a project or solution, the AI may create and configure every component project required by the requested solution and the applicable project-creation, layout, structure, and required-file instructions.

This exception applies only to the new project or solution being created. It does not authorize changes to unrelated existing projects.

## Validation exception

When the user requests solution-wide, project-wide, or other explicitly broad validation, the AI may run the build, test, and other validation commands needed to assess that scope across every included component.

These commands may create or update ordinary generated output, including build and intermediate files, test results, coverage reports, and disposable validation caches. This permission includes generated output inside otherwise restricted component projects.

A validation request does not by itself authorize source-code fixes or changes to project configuration, dependencies, lockfiles, snapshots, or other maintained files. It also does not authorize database migrations or changes to application data. Choose validation modes that preserve those files and data; obtain explicit authorization for any required changes outside the existing modification scope.

## Boundaries

Default modification access to a front-end project is limited to work relevant to the user's request. It does not authorize unrelated changes, destructive actions, or work outside the current project.

These conventions do not override higher-priority user instructions, repository instructions, environment permissions, or safety requirements. When the requested modification scope is ambiguous, preserve the restricted projects and ask the user to identify which project may be changed.
