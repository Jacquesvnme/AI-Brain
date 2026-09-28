# API validator conventions

Validators check incoming API data before an operation reaches its handler. They keep reusable or substantial transport validation out of controllers while leaving business invariants with the handler or domain model.

## Placement

Place validators in the API project's top-level `Validators` directory. Group them by the same feature or controller used under `Handlers`:

```text
Validators/
└── Mods/
    ├── AddModValidator.cs
    └── EditModValidator.cs
```

Use either the operation name or validated request name followed by `Validator.cs`. Follow one convention consistently within the project.

## Responsibilities

A validator may check:

- required values and non-empty strings;
- identifier shape;
- ranges, lengths, and collection limits;
- allowed enum or option values;
- relationships among fields in the same request; and
- normalization rules that are part of the transport contract.

Validators should be deterministic and side-effect free. Do not perform database writes, start transactions, send messages, or hide the main application operation in validation code.

Database-dependent uniqueness, authorization, current-state checks, and operation invariants remain handler responsibilities unless the project has a deliberate asynchronous validation design. Do not perform the same expensive lookup in both a validator and handler without a reason.

## Controller flow

Run the applicable validator before sending the query or command. Return a structured validation problem containing all useful input errors. Do not throw an exception for ordinary invalid input.

Small, obvious checks may remain inline in the controller. Extract validation when it is reused, has several rules, needs focused tests, or distracts from the controller's middleman flow.

## Documentation and testing

Document the validator type and any public rule result. Rule methods with clear names do not need comments unless the rule has a non-obvious constraint. Test validators directly with valid, boundary, and invalid inputs.
