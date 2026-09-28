# Value object conventions

Value objects represent focused, reusable concepts whose meaning comes from their values rather than a persistence identity. The Domain project's `ValueObjects` directory may also contain small shared response bases such as `HandlerBase` when they are used across application operations.

## Design

Keep a value object small and cohesive. Validate invariants at construction when the type owns those invariants. Prefer immutable state when mutation would allow an invalid or ambiguous value.

Do not create a value object only to wrap one primitive without adding meaning, validation, formatting, or behavior. Do not place database-specific fields in Domain value objects; persistence base fields belong in Infrastructure.

## HandlerBase

`HandlerBase` provides the standard operation outcome:

- `Success` indicates whether the operation completed successfully.
- `Message` describes the outcome for the immediate response consumer.

Handler responses inherit this record and add a result only when the operation returns data. Follow `errors-and-results.md` for failure behavior and message safety.

## Documentation

Every public value object requires a top-level XML summary. Document every public property, field, constructor parameter, and public operation that forms part of the value object's contract.

Explain invariants, normalization, equality behavior, units, formats, and special values where they affect use. Do not write summaries that repeat only the member name.
