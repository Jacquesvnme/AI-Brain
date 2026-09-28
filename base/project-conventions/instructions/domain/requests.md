# Request conventions

Requests describe structured input accepted by a controller or another application entry point. Keep shared request contracts in the Domain project's `Requests` directory. Handler-specific MediatR queries and commands may remain in their handler file when no other operation uses them.

## Shape

Use records for request contracts unless the type needs behavior that is clearer in a class. Express required input with `required` members, constructor parameters, or another mechanism supported by the serializer and validation system.

Do not reuse a persistence entity as a request. A request should expose only the data that the caller may supply. Server-owned identifiers, audit fields, calculated values, and internal state stay out of the request unless the endpoint explicitly accepts them.

## Documentation

Every public request requires a top-level XML summary. Every public request property requires a summary, including ordinary strings, numbers, identifiers, enums, Boolean values, dates, and collections.

Describe accepted format, range, units, and empty or null behavior when those details affect validation.

```csharp
/// <summary>
/// Contains the information required to create a saved mod collection.
/// </summary>
public sealed record AddModRequest
{
    /// <summary>
    /// Gets the display name assigned to the new collection.
    /// </summary>
    public required string CollectionName { get; init; }
}
```

Use `<example>` when a representative value improves generated API schema documentation.

## Validation

The API validates transport-level request rules before sending the handler command. The handler still validates operation invariants and current state. Keep reusable or substantial transport validation in the API `Validators` directory rather than adding behavior to request records.
