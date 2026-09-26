# Files required for all projects

This file defines the standard files required for every project type.

Apply every section in this file. Copy each referenced template to the destination specified by its section and complete any project-specific placeholders before finishing.

## Template file navigation

- **AGENTS.md:** `{project-path}\base\project-files\all\templates\AGENTS.md`
- **Creation.md:** `{project-path}\base\project-files\all\templates\Creation.md`
- **LICENSE:** `{project-path}\base\project-files\all\templates\LICENSE`
- **README.md:** `{project-path}\base\project-files\all\templates\README.md`

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
