### AGENTS.md {{All}}

Copy the example `AGENTS.md` into the outer project directory without changing its filename.

The file must direct Codex to read and follow the rules in the central AI Brain before modifying the project.

The reference to the AI Brain must include its absolute path:

`C:\~ My Files\AI-Brain\ai-brain.md`

Required rules always apply. Optional rules apply only when their description matches the current work or when the user explicitly requests them.

#### Example file

`{project-path}\base\example-files\AGENTS.md`

### Creation.md {{All}}

Copy the example `Creation.md` into the outer project directory.

`Creation.md` records the exact commands used to create every component project and add its direct package dependencies.

In this file, **project** means a project defined by a `.csproj` or `.esproj` file. It does not mean the `.sln` or `.slnx` solution file.

Create one section for every `.csproj` and `.esproj` project in the solution.

For each project, include:

- the full project name;
- the exact command or commands used in PowerShell to create it; and
- the exact package-manager command used to add each direct package dependency.

If no packages were added to a project, omit its package-command list.

Replace or remove every double-braced placeholder before adding the file to the project.

#### Example file

`{project-path}\base\example-files\Creation.md`

### README.md {{All}}

Copy the example `README.md` into the outer project directory without changing its filename.

Replace `PROJECT_NAME` with the actual project name.

Remove the double-braced instructional placeholder. Do not add a project description; the user will add it manually.

#### Example file

`{project-path}\base\example-files\README.md`

### LICENSE {{All}}

Copy the example `LICENSE` into the outer project directory without changing its filename.

The example contains the Apache License 2.0. Replace `{{Current year in the format: yyyy}}` with the current four-digit year.

Do not modify the remaining license text or the copyright holder’s name.

#### Example file

`{project-path}\base\example-files\LICENSE`
