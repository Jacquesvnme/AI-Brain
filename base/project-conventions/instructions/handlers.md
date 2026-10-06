# Handler conventions

Handlers contain one application operation and the small pieces of functionality needed to complete it. They sit between a controller or another entry point and the underlying domain, persistence, or integration code.

## Naming and placement

Name a handler by joining these parts without separators:

```text
Action + Subject + Handler.cs
```

The action is a verb such as `Get`, `Add`, `Edit`, `Delete`, or `Reorder`. The subject identifies the data or operation category. The filename always ends in `Handler.cs`.

Examples:

- `GetStatusHandler.cs`
- `AddModHandler.cs`
- `GetAllDeveloperPackagesHandler.cs`
- `ReorderModHandler.cs`

Place handlers in the API project's `Handlers` directory, grouped by controller, feature, or resource. A status handler belongs in `Handlers/Status`; mod handlers belong in `Handlers/Mods`.

## File order

Use this order unless a project-specific pattern requires another arrangement:

1. `using` directives;
2. file-scoped namespace;
3. XML documentation for the handler;
4. sealed handler with its primary constructor;
5. private dependency fields initialized from primary-constructor parameters;
6. the public `Handle` method;
7. private operation and helper methods;
8. the query or command record;
9. the response record; and
10. the result record, when the operation returns a payload.

Keep the query, response, and result in the handler file when they belong only to that operation. This makes navigation from the controller's query directly to the complete handler contract predictable. Move a contract to Domain only when it is genuinely shared outside that operation.

## Construction and dependencies

Use a primary constructor for injected dependencies. Every handler receives `ILogger<THandler>` so unexpected failures can be recorded at the operation boundary. Database contexts, clients, and other collaborators belong there when the operation requires them. Copy constructor parameters into private readonly fields directly inside the class:

```csharp
/// <summary>
/// Retrieves the current service status.
/// </summary>
public sealed class GetStatusHandler(
    IDbContextFactory<Context> contextFactory,
    ILogger<GetStatusHandler> logger)
    : IRequestHandler<GetStatusQuery, GetStatusResponse>
{
    private readonly IDbContextFactory<Context> _contextFactory = contextFactory;
    private readonly ILogger<GetStatusHandler> _logger = logger;
}
```

Inject only dependencies used by the handler. Do not resolve services manually inside `Handle`.

Database handlers inject `IDbContextFactory<Context>` and create an independently disposable context for each operation. Do not inject a long-lived `Context` directly into a handler. Follow `{project-path}\base\project-conventions\instructions\infrastructure\database.md` for the required creation, cancellation, and disposal pattern.

## The Handle method

`Handle` coordinates data flow. It should be easy to scan and should not contain the full operation implementation.

A typical `Handle` method:

1. receives the query or command and a `CancellationToken`;
2. enters a `try` block;
3. calls the main private operation method;
4. maps that outcome into the handler response;
5. copies `Success` and `Message` into the response;
6. maps any returned data into the result payload;
7. returns the response;
8. allows cancellation to propagate; and
9. catches any other unhandled exception, logs it, and returns a safe failed response.

```csharp
public async Task<GetStatusResponse> Handle(
    GetStatusQuery request,
    CancellationToken cancellationToken)
{
    try
    {
        var outcome = await GetStatus(cancellationToken);

        return new GetStatusResponse
        {
            Success = outcome.Success,
            Message = outcome.Message,
            Result = new GetStatusResult
            {
                ServiceStatus = outcome.Success ? "Status: Live" : "Status: Down"
            }
        };
    }
    catch (OperationCanceledException)
    {
        throw;
    }
    catch (Exception exception)
    {
        _logger.LogError(exception, "Unhandled exception occurred.");

        return new GetStatusResponse
        {
            Success = false,
            Message = "Unhandled exception occurred.",
            Result = new GetStatusResult
            {
                ServiceStatus = "Status: Down"
            }
        };
    }
}
```

Construct a response for both success and failure. The controller needs a stable response contract so it can inspect `Success` and `Message`. Do not make the controller infer failure from missing payload data.

Use `"Unhandled exception occurred."` as the standard log message and safe response message for this fallback until a handler defines a more useful operation-specific message. Pass the exception object to `LogError` so its technical details and stack trace reach the configured application log. Do not include the exception object, exception message, or stack trace in the response sent to a controller, frontend, or other consumer.

When a response has a result, make that result nullable and use `Result = null` in the unhandled-exception response unless the operation has a meaningful safe fallback. `GetStatusHandler` is the standard exception: it returns a result whose service status is `"Status: Down"`. When a response has no result, return only `Success = false` and the standard message rather than adding an empty result.

An ordinary result-bearing handler uses this fallback shape:

```csharp
catch (Exception exception)
{
    _logger.LogError(exception, "Unhandled exception occurred.");

    return new EditUserResponse
    {
        Success = false,
        Message = "Unhandled exception occurred.",
        Result = null
    };
}
```

The request parameter may be unused for an empty query, but it remains part of the MediatR contract. Do not discard the cancellation token.

## Operation methods

Put the primary behavior in a private method named for the action and subject, such as `GetStatus`, `AddMod`, or `ReorderMod`. Split the behavior into more private methods when the operation has several meaningful steps.

Each method should own one recognizable part of the operation. `Handle` calls these methods in the required order and deals with their outcomes. Extraction should improve readability or isolate behavior; do not create one-line helpers that hide straightforward code.

Operation methods should return an explicit outcome containing:

- `Success`;
- `Message`; and
- the returned data, when applicable.

Small private operations may use named tuples:

```csharp
Task<(bool Success, string Message, GetStatusResult Result)>
```

Use a dedicated result type when the outcome is reused, contains enough fields that a tuple becomes hard to read, or needs its own behavior.

Check each operation outcome before consuming its data. Return a failure as soon as a required step fails. Do not continue with missing, invalid, or unsuccessful data.

## Query, response, and result records

Queries, commands, responses, and results should normally be records.

- The query or command implements `IRequest<TResponse>`.
- The response inherits `HandlerBase` and therefore provides `Success` and `Message`.
- The result contains the operation's returned payload.

The result is optional. Omit it when the operation only needs to report success and a message. An empty response can be declared directly:

```csharp
public sealed record ReorderModResponse : HandlerBase;
```

Do not add an empty result record only to preserve symmetry. When a result exists, initialize collection and reference properties to safe defaults where that matches the contract.

## Validation and null handling

Treat controller validation as the first boundary, not the only boundary. A handler must still protect its own invariants and check data returned by databases, files, services, and helper methods.

- Check for `null` before dereferencing optional data.
- Check `Success` before consuming an operation result.
- Validate identifiers and required values before persistence work.
- Use `string.Equals(value, expected, StringComparison.OrdinalIgnoreCase)` for case-insensitive equality.
- Use comparison-aware `Contains` overloads when available instead of lowercasing both values.
- Avoid repeated normalization that changes the stored or displayed value.

## Cancellation

Every asynchronous handler receives a `CancellationToken`. Pass it to Entity Framework, file, HTTP, and other asynchronous operations that accept cancellation. Database operations must not drop it.

Do not convert `OperationCanceledException` into an ordinary failed response. Cancellation means the caller no longer needs the operation. Let the framework observe it unless the application has a specific cancellation policy.

## Errors

Expected failures return a failed outcome. Do not throw exceptions for not-found data, invalid input, conflicts, unavailable optional data, or other conditions the application can represent normally.

The public asynchronous `Handle` method is the final exception boundary for a handler. Wrap its operation call and response mapping in the standard `try` and `catch` structure. Log every caught unexpected exception through the handler's `ILogger<THandler>`, then return the standard safe failed response. Do not catch and translate an exception without logging it, and do not expose connection strings, paths, SQL, stack traces, exception messages, or other internal details in that response.

Throw only when the application cannot safely start or continue, such as a missing mandatory database configuration during startup. See `errors-and-results.md` for the complete failure policy.

## Documentation

The handler type requires an XML summary. Query, response, result, and public payload properties also require XML documentation. Private operation methods do not need comments when their names and signatures explain them. Add documentation when a method has non-obvious sequencing, side effects, constraints, or failure behavior.
