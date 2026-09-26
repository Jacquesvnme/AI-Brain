# Project creation instructions

This document defines how to create a complete solution or add a supported component project to an existing solution. It provides full PowerShell scripts for the standard layouts and individual instructions for creating one project at a time.

These instructions define project names, creation commands, execution order, working directories, and verification requirements. They complement the project-layout instructions, which define where the resulting directories and files belong, and the required-project-files instructions, which define the shared files that must be added to the solution.

In this document, a **project** is a component represented by a `.csproj` or `.esproj` file. It does not mean the outer solution directory or the `.slnx` solution file.

## Variables

**PROJECT_NAME:** The actual name of the application or solution being created. It must match the name of the outer project directory and the inner source directory defined by the selected project layout.

Replace every `PROJECT_NAME` placeholder in project names, directory names, and commands with this value. For example, if the application is named `SuperDummyApplication`, `PROJECT_NAME.Domain` becomes `SuperDummyApplication.Domain`. Do not leave the literal `PROJECT_NAME` placeholder in the created solution.

**FRAMEWORK:** The .NET target framework used by component projects. The default is .NET 10, represented by the target-framework moniker `net10.0`. Complete scripts store this value in `$Framework`; individual instructions include `net10.0` directly in their creation commands. The `.slnx` solution file itself does not target a framework.

## Creation methods

Use exactly one of these methods for the initial creation work:

- **Complete script:** Use the single script that matches the selected standard project layout when creating a new solution from scratch. Do not also run the equivalent individual creation commands.
- **Individual instructions:** Use the relevant project instruction files when adding a component to an existing solution, creating a custom layout, or when the complete script cannot be used.

Both methods must produce the structure defined by the selected project layout. After creation, complete the shared post-creation steps in this document.

## Working directories

### Complete scripts

Run a complete script from the parent directory in which the new outer `PROJECT_NAME` solution directory should be created. The script creates the outer directory, enters it, and runs all component creation commands from there.

Pass the actual project name through the script's mandatory `-ProjectName` parameter. Do not edit the script to hardcode the project name.

For example:

```powershell
& "{project-path}\base\project-creation\scripts\create-console-project.ps1" -ProjectName "Example"
```

The target outer directory must not already contain a solution or component projects created by an earlier run of the script.

### Individual commands

Run every creation command from the outer solution directory. Each component command includes the inner `PROJECT_NAME` source directory in its `--output` path, so the command creates its project at the correct level without changing directories first.

For a project named `Example`, run the commands from the outer `Example` directory:

```text
Example/            ← outer solution directory; run creation commands here
├── Example.slnx
└── Example/        ← inner source directory
    ├── Example.Console/
    └── Example.Domain/
```

For example, `--output Example/Example.Domain` creates the Domain project inside the inner source directory. The inner directory does not need to be the active PowerShell location.

## Project creation navigation

### Individual instructions

- **project-console.md:** `{project-path}\base\project-creation\instructions\project-console.md`
- **project-desktop.md:** `{project-path}\base\project-creation\instructions\project-desktop.md`
- **project-domain.md:** `{project-path}\base\project-creation\instructions\project-domain.md`
- **project-slnx.md:** `{project-path}\base\project-creation\instructions\project-slnx.md`
- **project-test.md:** `{project-path}\base\project-creation\instructions\project-test.md`
- **project-ui-and-api.md:** `{project-path}\base\project-creation\instructions\project-ui-and-api.md`

### Scripts

- **create-console-project.ps1:** `{project-path}\base\project-creation\scripts\create-console-project.ps1`
- **create-react-web-api.ps1:** `{project-path}\base\project-creation\scripts\create-react-web-api.ps1`
- **create-react-web-api-desktop.ps1:** `{project-path}\base\project-creation\scripts\create-react-web-api-desktop.ps1`

## Script selection

Select exactly one script based on the chosen project layout:

- **Console:** Use `create-console-project.ps1`. It creates the SLNX, Console, Domain, and Test projects.
- **React Web API:** Use `create-react-web-api.ps1`. It creates the SLNX, UI, API, Domain, and Test projects.
- **React Web API with Desktop:** Use `create-react-web-api-desktop.ps1`. It creates everything in the React Web API layout plus the Desktop project.

The React scripts require the `reactwebapi` .NET template to be installed before execution. Each script creates the `.slnx`, creates and renames its required component projects, and registers those projects in the solution. A script stops when a command returns a nonzero exit code or a required rename or solution-registration operation fails. It prints a green success message after each successful operation.

## Applying the instructions

1. Determine the requested solution type and select the matching project layout.
2. Set the actual project name. Replace `PROJECT_NAME` in individual instructions, or pass the value to a complete script with `-ProjectName`.
3. Choose either the matching complete script or the required individual instruction files. Do not execute both creation methods for the same projects.
4. For a complete script, invoke the selected script from the parent directory that should contain the new outer solution directory. The script creates the solution, creates its components, performs its required directory renames, and adds the component projects to the `.slnx`.
5. For individual creation, create or enter the outer solution directory, create the SLNX, and then run the required component instructions from that outer directory. Create UI and API before the other components when they are part of the layout. After creation and renaming, add every `.csproj` and `.esproj` to the `.slnx`.
6. Confirm that every generated directory, `.slnx`, `.csproj`, and `.esproj` file has the name and location required by the selected layout. Complete any project-file renaming or internal reference updates not handled by the chosen creation method.
7. Inspect the `.slnx` and verify that every created project is registered once with the correct relative path.
8. Apply the required-project-files instructions. Treat the generated and populated `.slnx` as the solution file required by those instructions; do not overwrite it with the `Project.slnx` template. Apply any required solution-entry configuration to the existing `.slnx` instead.
9. Record the exact component creation and direct package-dependency commands in `Creation.md`. Do not treat the `.slnx` as a component project.
10. Restore dependencies and build or test the solution to confirm that project paths and references are valid. A green template-creation message does not replace this final restore and verification step.

Do not create component projects that are absent from the selected layout unless the user explicitly requests them. Do not combine or alter the documented creation commands without a project-specific reason.
