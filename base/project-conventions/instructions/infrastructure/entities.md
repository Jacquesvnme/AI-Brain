# Entity conventions

Persistence entities represent records stored by the application's database technology. Keep them in the Infrastructure project's `Entities` directory and name each type with the `Entity` suffix.

## Separation

Entities belong to the persistence model. Do not use an entity as an API request, API response, or general domain model. Map it at the Infrastructure or application boundary so database schema changes do not silently redefine public contracts.

An entity may inherit the Infrastructure `EntityBase` when it needs shared persistence fields. Database-specific keys, timestamps, concurrency values, and navigation members stay in Infrastructure.

## Shape and initialization

Use nullability, required members, and defaults to match the actual database contract. Initialize collection navigation properties when an empty collection is valid. Do not assign placeholder values that conceal a missing required field.

Keep persistence configuration in the established Entity Framework configuration or context layer when attributes would mix too much provider behavior into the entity. Follow the project's existing mapping strategy consistently.

## Documentation

Entities require detailed XML documentation because each member affects persistence and migrations.

Every public entity requires a top-level summary that identifies the stored concept. Every public mapped property, key, foreign key, concurrency field, timestamp, collection, and navigation property requires its own summary.

Document the details that affect correct persistence use:

- whether a property is a key or foreign key;
- the relationship represented by a navigation member;
- whether a value is required or optional;
- units and time basis, such as UTC;
- generated, calculated, or server-owned behavior;
- meaningful length or format constraints; and
- the meaning of null, zero, an empty string, or an empty collection when it is not obvious.

```csharp
/// <summary>
/// Stores a saved collection of game modifications.
/// </summary>
public sealed class ModEntity : EntityBase
{
    /// <summary>
    /// Gets or sets the user-facing name stored for the collection.
    /// </summary>
    public required string CollectionName { get; set; }
}
```

Do not invent database constraints in documentation. XML comments describe the implemented contract and do not replace migrations, model configuration, or database constraints.

## Errors

Persistence failures should be caught at the operation boundary and converted into a failed handler outcome with a safe message. Log the original exception when possible. Do not expose SQL, connection details, or sensitive paths through a response.
