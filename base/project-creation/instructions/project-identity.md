# Identity project

The Identity project is a C# class library for authentication- and authorization-related data, classes, and supporting logic. It is not an executable and does not run on its own. It is typically referenced and used by the API project when authentication or authorization is needed.

## Naming

`PROJECT_NAME.Identity`

## Creation

Run this command from the outer `PROJECT_NAME` solution directory. The `--output` path places the project inside the inner source directory.

```powershell
dotnet new classlib --name PROJECT_NAME.Identity --output PROJECT_NAME/PROJECT_NAME.Identity --framework net10.0
```

## Expected output

```text
PROJECT_NAME/
└── PROJECT_NAME.Identity/
    └── PROJECT_NAME.Identity.csproj
```

## Expected structure

- **project-identity.md:** `{project-path}\base\project-structure\instructions\project-identity.md`
