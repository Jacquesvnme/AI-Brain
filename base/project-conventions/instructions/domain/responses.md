# Response conventions

Responses describe structured information returned across an application boundary. Shared response contracts belong in the Domain project's `Responses` directory. A handler response used by one operation should normally stay in that handler file.

## Shape

Use records for response contracts unless behavior or identity requires a class. Initialize collection properties when an empty collection is a valid successful result. Preserve null when absence has a different meaning from an empty value.

Handler responses inherit `HandlerBase` so callers receive `Success` and `Message` consistently. Add a result property only when the operation returns a payload.

Do not expose persistence entities directly from an API response when that would leak database fields, relationships, or schema decisions. Map the required data into a response or result contract.

## Documentation

Every public response and result type requires a top-level XML summary. Every public property requires its own summary.

Document:

- the meaning of each returned value;
- whether collections may be empty;
- whether a property is available on failed responses;
- date, time, unit, and format conventions; and
- any state represented by a default value.

Examples may use `<example>` when they help Swagger or another consumer understand the schema.

## Failure responses

A failed handler response still sets `Success` and `Message`. Do not require a populated result when the operation failed unless partial data is an intentional part of the contract. Controllers map failed handler responses into the appropriate HTTP problem response.
