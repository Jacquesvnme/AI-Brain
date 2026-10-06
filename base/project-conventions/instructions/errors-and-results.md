# Error and result conventions

Failures should be explicit data whenever the application can recover, report the problem, or choose another action. Unhandled exceptions are reserved for conditions that prevent the application from starting or continuing safely.

## Standard handler response

Handler responses inherit a shared `HandlerBase` record with two required properties:

```csharp
public record HandlerBase
{
    /// <summary>
    /// Indicates whether the operation completed successfully.
    /// </summary>
    public required bool Success { get; set; }

    /// <summary>
    /// Describes the outcome in a form suitable for the response consumer.
    /// </summary>
    public required string Message { get; set; }
}
```

Every handler outcome must set both values. A successful response uses `Success = true`; a failed response uses `Success = false` and a message that explains the failure at the correct level for its consumer.

Do not require callers to infer success from a non-null result. The payload and the outcome answer different questions.

## Method outcomes

Private handler operations and other fallible application methods should return a consistent outcome containing `Success`, `Message`, and optional data:

```csharp
(bool Success, string Message)
(bool Success, string Message, TResult Result)
```

Use a named result record instead of a tuple when the outcome crosses a public boundary, is reused, or becomes difficult to understand from its signature.

Callers must check the outcome before using its data:

```csharp
var outcome = await GetRequiredModList(cancellationToken);
if (!outcome.Success)
    return (false, outcome.Message, new());

var mods = outcome.Mods;
```

Check a reference result for `null` when its contract allows `null`. Do not add redundant null checks to values whose type and construction guarantee a value.

## Expected failures

Return a failed result for conditions such as:

- invalid or missing user input;
- a requested record that does not exist;
- a conflict with current state;
- unavailable optional files or external data;
- a database operation that could not complete; or
- another operation returning `Success = false`.

Use early returns to keep the successful path clear. Preserve a useful message when passing a failure upward, but replace internal technical detail with a safe message before it reaches an API client or user interface.

## Exceptions

Avoid throwing exceptions for expected control flow. Do not throw simply to move a validation or not-found result through several methods.

An exception is appropriate when a required startup invariant is missing and the process cannot operate safely. Examples include an absent mandatory database path, an invalid required connection configuration, or failure to initialize a required host dependency.

At runtime boundaries:

- catch exceptions that can be translated into a meaningful failed result;
- log every caught unexpected exception and its structured operation context through the injected `ILogger<T>`;
- do not expose stack traces, SQL, credentials, connection strings, or sensitive filesystem paths in `Message`;
- do not use an empty catch block; and
- do not catch `OperationCanceledException` as an ordinary application failure.

Executable projects must configure built-in logging with Serilog according to `{project-path}\base\project-conventions\instructions\api\observability.md`. Do not silently skip error logging because a logger was not wired; correct the executable composition root instead.

Fatal startup exceptions should contain enough context for the operator to correct the configuration. Runtime client messages should explain what failed and what the user can do, without leaking internals.

## Validation and comparisons

Validate at each trust boundary. Controllers validate incoming transport data. Handlers validate operation invariants. Persistence and integration methods validate data returned from their external boundary.

Prefer direct, intention-revealing comparisons:

```csharp
string.Equals(actual, expected, StringComparison.OrdinalIgnoreCase)
values.Contains(candidate, StringComparer.OrdinalIgnoreCase)
```

Do not lowercase both strings only to compare them. Avoid broad catch blocks as a substitute for null checks, validation, or explicit failure results.

## API mapping

Controllers map handler outcomes to HTTP results:

- return `Ok(response)` for a successful operation;
- return `ValidationProblem` or a `400` response for invalid client input;
- return a suitable not-found or conflict response when the failure has that meaning; and
- return `Problem` with an appropriate status for unavailable dependencies or failed server operations.

The status code and problem title should describe the category of failure. `response.Message` may supply safe detail. Use a generic fallback when the response is `null` or its message is unsuitable for clients.

## Documentation

Document the meaning of `Success`, `Message`, and every public result property. State nullability, units, allowed states, or fallback behavior where those details affect correct use.
