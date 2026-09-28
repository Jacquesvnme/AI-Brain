# Comment and documentation conventions

Documentation explains contracts, intent, constraints, and behavior that a reader cannot safely infer from syntax alone. It should make public types usable without forcing the reader to inspect their implementation.

## Required XML documentation

Use triple-slash XML documentation for:

- every public class, record, struct, interface, and enum;
- every handler and controller type;
- every public model, request, response, value object, and persistence entity;
- every public data property or field, including ordinary `string`, numeric, Boolean, date, identifier, enum, collection, and navigation properties;
- public methods that form an API used outside their defining type; and
- controller endpoints, using the additional Swagger conventions in `api/controllers.md`.

Begin with a summary block:

```csharp
/// <summary>
/// Describes what the type or member represents or does.
/// </summary>
```

Never leave an empty `<summary>` in finished code. Write a complete sentence when practical, and use the same domain terminology as the code.

## Documentation depth

The amount of documentation depends on the contract.

- A handler or class needs a top-level summary of its responsibility.
- A model needs a top-level summary and documentation for each public member.
- An enum needs a top-level summary. Document individual values when their meaning, external representation, or effect is not obvious from the name.
- A request and response need a top-level summary and documentation for each public member.
- A value object needs a top-level summary and documentation for each public member, invariant, or special state.
- A persistence entity needs detailed top-level documentation and documentation for every mapped property, key, relationship, and navigation member.

Documentation must be specific enough to distinguish nearby concepts. `Gets or sets the value` is not useful. State what the value means, which unit or time basis it uses, whether it may be absent, and any constraint a caller must honor.

## XML elements

Use XML elements according to their purpose:

- `<summary>` describes the type or member.
- `<remarks>` explains constraints, lifecycle, sequencing, side effects, or usage that does not fit in the summary.
- `<param>` describes a parameter when its purpose or accepted values need explanation.
- `<returns>` explains the returned value and important outcome states.
- `<exception>` documents an exception that the method deliberately exposes as part of its contract.
- `<example>` supplies a representative value when it makes a schema or property easier to understand.
- `<response>` documents controller HTTP outcomes for Swagger.

Do not add an `<exception>` entry for exceptions that should have been converted into normal failure results.

## Methods and implementation comments

Private handler operation methods do not require XML documentation when the method name, parameters, and return type explain the behavior. Add a summary or a focused inline comment when a method has:

- non-obvious sequencing;
- a constraint imposed by another system;
- surprising side effects;
- a workaround whose reason is not visible in the code;
- complex failure behavior; or
- cognitive complexity that remains high after reasonable refactoring.

Comments should explain why the code exists or what contract it preserves. Do not narrate each line, restate the method name, preserve obsolete implementation history, or use comments to compensate for unclear names.

## Records and positional parameters

Property-based records use a summary on the record and each public property. For a positional record, document the record and its constructor parameters with `<param>` elements when those parameters form a public contract.

Prefer property-based records when per-property Swagger or XML documentation is important and the positional form makes that documentation hard to surface.

## Controllers and Swagger

Controller documentation has additional requirements because it feeds the public API description. Every endpoint documents its summary and expected response codes. Add remarks, parameter descriptions, response types, and examples when they help callers use the endpoint correctly.

Follow `api/controllers.md` for `[ProducesResponseType]`, `ProblemDetails`, validation responses, and the required agreement between XML and runtime behavior.

## Related convention files

- Domain enums: `{project-path}\base\project-conventions\instructions\domain\enum.md`
- Domain models: `{project-path}\base\project-conventions\instructions\domain\models.md`
- Domain requests: `{project-path}\base\project-conventions\instructions\domain\requests.md`
- Domain responses: `{project-path}\base\project-conventions\instructions\domain\responses.md`
- Domain value objects: `{project-path}\base\project-conventions\instructions\domain\value-objects.md`
- Infrastructure entities: `{project-path}\base\project-conventions\instructions\infrastructure\entities.md`
- Handlers: `{project-path}\base\project-conventions\instructions\handlers.md`
- Controllers: `{project-path}\base\project-conventions\instructions\api\controllers.md`

## Writing quality

Keep documentation plain, factual, and current. Describe the current contract rather than the history of how it was implemented. Avoid filler, praise, vague claims, and repeated summaries.

Use the Humanizer skill when generated documentation sounds formulaic or repetitive. Read `{project-path}\skills\external\humanizer.md` before using it. Humanization must preserve every technical claim, identifier, example, link target, and code block. It must not turn precise reference prose into casual marketing language.

## Review checklist

Before finishing a documented type, confirm that:

1. every required public type and member has XML documentation;
2. the documentation matches current behavior and nullability;
3. public data properties describe meaning rather than syntax;
4. controller response documentation matches actual status codes;
5. comments do not expose secrets or sensitive implementation details;
6. no empty summaries or placeholder text remain; and
7. the prose reads naturally without losing technical precision.
