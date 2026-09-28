# Enum conventions

Enums represent a closed set of named domain states or choices. Keep them in the Domain project's `Enums` directory when they are shared across the system.

## Naming and shape

Use a singular type name for an enum whose values represent one selected state, unless an established external contract requires another name. Give each member a concrete domain name. Avoid placeholder values such as `Other` or `Unknown` unless the domain genuinely needs that state and its behavior is defined.

Assign explicit numeric values when persisted data, serialized contracts, or compatibility depend on stable values. Do not reorder or renumber a persisted enum without a migration and compatibility review.

Use `[Flags]` only when values may be combined meaningfully. Flag values must use compatible bit values and include a zero state when the domain has a valid `None` value.

## Documentation

Every public enum requires a top-level XML summary:

```csharp
/// <summary>
/// Identifies the playable faction associated with a mod collection.
/// </summary>
public enum PlayableFaction
{
    // Values
}
```

Document individual members when a name is abbreviated, maps to an external value, carries non-obvious behavior, or could be confused with another member. A clear domain name does not need a comment that merely repeats it.

## Use

Validate that incoming numeric or text values map to a defined member before using them. Do not rely on an enum cast alone to prove validity. Define serialization rules deliberately when an API exposes names rather than numbers.
