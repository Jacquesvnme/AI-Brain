# Desktop project

The Desktop project is the Windows Forms application used as the solution's Windows desktop host. Create it only when the selected project layout includes a Desktop project.

## Naming

`PROJECT_NAME.Desktop`

## Creation

Run this command from the outer `PROJECT_NAME` solution directory. The `--output` path places the project inside the inner source directory.

```powershell
dotnet new winforms --name PROJECT_NAME.Desktop --output PROJECT_NAME/PROJECT_NAME.Desktop --framework net10.0
```

## Expected output

```text
PROJECT_NAME/
└── PROJECT_NAME.Desktop/
    └── PROJECT_NAME.Desktop.csproj
```
