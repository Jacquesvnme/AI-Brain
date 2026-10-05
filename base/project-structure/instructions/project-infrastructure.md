# Infrastructure Project

The Infrastructure project contains database-related implementation, including database setup, persistence entities, migration, seeding, and dependency registration. Its standard structure is organized around those database responsibilities.

Replace `PROJECT_NAME` with the actual project name throughout the structure.

## Expected structure

```text
PROJECT_NAME.Infrastructure/
├── Database/
│   ├── Context.cs
│   ├── ContextFactory.cs
│   └── DatabasePath.cs
├── Entities/
│   └── ExampleEntity.cs
├── Migrations/
│   └── DatabaseMigration.cs
├── Seeding/
│   └── SeedingData.cs
├── DependencyInjection.cs
├── EntityBase.cs
└── PROJECT_NAME.Infrastructure.csproj
```

Apply the database behavior and lifetime conventions in `{project-path}\base\project-conventions\instructions\infrastructure\database.md` whenever this project contains a database.

## Directory responsibilities

### Database

The `Database` directory contains the foundational classes required to configure and create access to the database.

- `Context.cs` defines the Entity Framework database context and its entity sets.
- `ContextFactory.cs` creates the context for design-time Entity Framework tooling.
- `DatabasePath.cs` resolves and validates the configured database-file location.

Adapt these files when the selected database technology requires different setup, while retaining the responsibility of the directory.

### Entities

The `Entities` directory contains persistence entities representing the records stored in the database. Name each entity with the `Entity` suffix, such as `ModEntity.cs`.

Entities may inherit `EntityBase` when they require the shared database fields defined by that base type.

### Migrations

The `Migrations` directory contains database creation and schema-update behavior. `DatabaseMigration.cs` owns the migration workflow for the selected provider.

### Seeding

The `Seeding` directory contains baseline data population. `SeedingData.cs` owns conditional initialization of required baseline records.

## Root files

### DependencyInjection.cs

`DependencyInjection.cs` registers database configuration, context factories, migration, seeding, and other Infrastructure dependencies. The consuming executable host calls these extensions from its composition root.

### EntityBase.cs

`EntityBase.cs` contains database-specific fields and behavior shared by persistence entities. It belongs in Infrastructure because its responsibility is tied directly to database entities, even when it resembles a reusable value object.

## Project file

`PROJECT_NAME.Infrastructure.csproj` contains the database provider and persistence package references required by the selected implementation. Do not add executable startup behavior to this class-library project.
