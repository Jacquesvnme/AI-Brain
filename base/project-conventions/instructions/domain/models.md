# Model conventions

Domain models describe information used across the system for a domain purpose. Keep them independent of HTTP, user-interface, and persistence implementation details unless the model is explicitly designed for one of those boundaries.

## Scope

A model should have one clear meaning. Do not reuse one class as an API request, database entity, user-interface state object, and domain model merely because the fields currently look similar. Separate representations when their validation, lifecycle, ownership, or compatibility requirements differ.

Prefer records for data-focused contracts and classes when identity, controlled mutation, or behavior makes a class clearer. Use `required`, nullable annotations, constructors, and defaults so that the type communicates which states are valid.

Collections should be initialized when an empty collection is a valid default. Do not use an empty string or default enum member to hide a genuinely missing required value.

## Documentation

Every public model requires a top-level XML summary. Every public property or field requires its own summary.

Property documentation should state:

- what the value represents;
- its unit, format, or time basis when applicable;
- whether an empty, default, or null value has a defined meaning; and
- any constraint needed to use the value correctly.

```csharp
/// <summary>
/// Describes a saved collection of game modifications.
/// </summary>
public sealed record ModCollection
{
    /// <summary>
    /// Gets the display name chosen for the collection.
    /// </summary>
    public required string CollectionName { get; init; }
}
```

Avoid summaries such as `The collection name` when they add nothing beyond the identifier.

## Mapping

Map between models, requests, responses, and entities at a clear boundary. Mapping code should make intentional differences visible instead of relying on unsafe casts or shared mutable instances.
