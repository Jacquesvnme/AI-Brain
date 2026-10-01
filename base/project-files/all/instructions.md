# Files required for all projects

This file defines the standard files required for every project type.

Apply every section in this file. Initialize Git as instructed, copy each referenced template to the destination specified by its section, and complete any project-specific placeholders before finishing.

These instructions complement project creation and project layout. Apply them to the outer solution directory after its initial layout exists, without overwriting populated generated files unless the relevant section explicitly requires replacement.

## Variables

**PROJECT_NAME:** The actual application or solution name. Replace every `PROJECT_NAME` placeholder with this value.

**Current year:** The current four-digit year used where a template explicitly requests it.

## Template file navigation

- **AGENTS.md:** `{project-path}\base\project-files\all\templates\AGENTS.md`
- **Creation.md:** `{project-path}\base\project-files\all\templates\Creation.md`
- **LICENSE:** `{project-path}\base\project-files\all\templates\LICENSE`
- **README.md:** `{project-path}\base\project-files\all\templates\README.md`

## Git repository initialization

Every new project must have a Git repository initialized in the topmost directory of the current project. For the standard layouts, this is the outer solution directory that contains the solution and inner source directory. The repository metadata is a required part of the project baseline even though it is not created from a template.

After the topmost project directory exists, run the following command from that directory:

```powershell
git init
```

Git may be initialized at any point after the topmost project directory exists. Do not initialize Git in an inner source directory or component-project directory. Do not stage or commit the baseline while project creation or required-file work remains unfinished.

After all initial project creation, required files, configuration, dependency setup, and verification are complete, review the resulting project state. When satisfied that the baseline is finished, run the following commands from the topmost project directory:

```powershell
git add .
git commit -m "Initial commit"
```

Create this initial commit only once, as the final step of establishing the new project's baseline. If the target directory is already part of a Git repository or has existing Git history, preserve that repository and history; do not reinitialize it or create another `Initial commit` under this instruction.

## AGENTS.md

Copy the template `AGENTS.md` into the outer project directory without changing its filename.

The file must direct Codex to read and follow the rules in the central AI Brain before modifying the project.

The reference to the AI Brain must include its absolute path:

`C:\~ My Files\AI-Brain\ai-brain.md`

Required rules always apply. Optional rules apply only when their description matches the current work or when the user explicitly requests them.

### Template file

`{project-path}\base\project-files\all\templates\AGENTS.md`

## Creation.md

Copy the template `Creation.md` into the outer project directory.

`Creation.md` records the exact commands used to create every component project and add its direct package dependencies.

In this file, **project** means a project defined by a `.csproj` or `.esproj` file. It does not mean the `.sln` or `.slnx` solution file.

Create one section for every `.csproj` and `.esproj` project in the solution.

For each project, include:

- the full project name;
- the exact command or commands used in PowerShell to create it; and
- the exact package-manager command used to add each direct package dependency.

If no packages were added to a project, omit its package-command list.

Replace or remove every double-braced placeholder before adding the file to the project.

### Template file

`{project-path}\base\project-files\all\templates\Creation.md`

## LICENSE

Copy the template `LICENSE` into the outer project directory without changing its filename.

The template contains the Apache License 2.0. Replace `{{Current year in the format: yyyy}}` with the current four-digit year.

Do not modify the remaining license text or the copyright holder’s name.

### Template file

`{project-path}\base\project-files\all\templates\LICENSE`

## README.md

Copy the template `README.md` into the outer project directory without changing its filename.

Replace `PROJECT_NAME` with the actual project name.

Remove the double-braced instructional placeholder. Do not add a project description; the user will add it manually.

### Template file

`{project-path}\base\project-files\all\templates\README.md`

## Applying the instructions

1. Confirm the outer solution directory and actual project name.
2. For a new project that is not already in a Git repository, initialize Git in the topmost project directory. Do not initialize a nested source or component-project directory.
3. Read the template navigation and every file section in this document.
4. Copy each template to its documented destination.
5. Replace or remove every documented placeholder without changing fixed template content.
6. Preserve generated or already populated files when the applicable project-creation instructions say to update them instead of overwriting them.
7. Verify that every required file exists at the outer solution level with the correct filename and project-specific values.
8. After the entire initial project baseline is complete and verified, stage it and create the one-time `Initial commit` as instructed in the Git repository initialization section.
