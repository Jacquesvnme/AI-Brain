# API controller conventions

Controllers are HTTP middlemen. They define the transport contract, validate incoming data, send one query or command to its handler, and translate the handler response into an HTTP result. Business logic, database access, and multi-step application behavior belong outside the controller.

## File structure

Use this order:

1. `using` directives;
2. file-scoped namespace;
3. XML documentation for the controller;
4. `[ApiController]` and `[Route]` attributes;
5. sealed controller with a primary constructor;
6. private dependency fields; and
7. documented endpoint methods.

Controllers normally inject `IMediator` through a primary constructor and store it in a private readonly field.

```csharp
/// <summary>
/// Reports the availability of the API and its required dependencies.
/// </summary>
[ApiController]
[Route("api/status")]
public sealed class StatusController(IMediator mediator) : ControllerBase
{
    private readonly IMediator _mediator = mediator;
}
```

Use an API route based on the controller's resource name. Keep routes stable and user-facing. A method name may be more descriptive than its route segment.

## RESTful routing

**Required:** Design HTTP APIs as RESTful, resource-oriented APIs unless the user explicitly requires another API style. Routes identify resources, while HTTP methods express the operation performed on those resources.

Use nouns for resource paths and prefer plural resource names for collections. Represent relationships through nested resource paths when that relationship is part of the public contract. Do not encode routine CRUD operations as action routes such as `/get-mods`, `/create-mod`, or `/delete-mod`; use `GET`, `POST`, `PUT`, `PATCH`, and `DELETE` against the applicable resource instead.

**Required:** Write every literal route segment in kebab-case. Assume kebab-case for all API paths unless the user explicitly authorizes another casing convention. Do not switch to PascalCase, camelCase, snake_case, or another route style merely because it matches a controller, method, or type name.

```csharp
[ApiController]
[Route("api/mod-collections")]
public sealed class ModCollectionsController(IMediator mediator) : ControllerBase
{
    [HttpGet("{collectionId:guid}")]
    public async Task<ActionResult<GetModCollectionResponse>> GetModCollection(
        Guid collectionId,
        CancellationToken cancellationToken)
    {
        // Endpoint flow omitted.
    }
}
```

Route parameter values are identifiers or user data and are not recased. Parameter placeholder names remain implementation identifiers; the kebab-case requirement applies to the literal path segments exposed to API consumers.

Prefer explicit route templates such as `api/mod-collections`. Use `[controller]` route tokens only when the application configures a route-token transformer that guarantees kebab-case output for every controller name.

## Endpoint methods

Each method must declare its HTTP verb and route through attributes such as `[HttpGet]`, `[HttpPost]`, `[HttpPut]`, or `[HttpDelete]`. Give named endpoints a stable name with `nameof(MethodName)` when route generation or OpenAPI consumers use it.

Return `Task<ActionResult<TResponse>>` for an endpoint with a typed success response. Accept a `CancellationToken` and pass it to the mediator.

A controller action should normally do only this:

1. validate route, query, and body input;
2. create one query or command;
3. send it through the mediator with the cancellation token;
4. check whether the response is `null` or unsuccessful;
5. map failure to a suitable HTTP problem; and
6. return `Ok(response)` on success.

```csharp
public async Task<ActionResult<GetStatusResponse>> GetStatus(
    CancellationToken cancellationToken)
{
    var response = await _mediator.Send(new GetStatusQuery(), cancellationToken);
    if (response == null || !response.Success)
    {
        return Problem(
            statusCode: StatusCodes.Status503ServiceUnavailable,
            title: "Database unavailable",
            detail: response?.Message ?? "The API could not connect to the database.");
    }

    return Ok(response);
}
```

One endpoint should call one handler. If an endpoint needs several application steps, compose them inside the handler rather than turning the controller into an orchestrator.

## Validation

Validate incoming transport data before sending it to the handler. This includes binding failures, missing required values, malformed identifiers, invalid ranges, and other checks that can be completed without running the operation.

Use validators from the API project's `Validators` directory for reusable or non-trivial validation. Keep short checks in the controller only when extracting them would make the flow harder to read. Return `ValidationProblem` or another clear `400` response when validation fails.

The handler remains responsible for operation invariants and data that can change after controller validation. Do not assume controller validation makes handler validation unnecessary.

## Failure mapping

Check both `response == null` and `!response.Success` before reading result data. Map failures according to their meaning rather than returning the same status for every case.

- Invalid input maps to `400 Bad Request`.
- Missing resources normally map to `404 Not Found`.
- State conflicts normally map to `409 Conflict`.
- Required unavailable dependencies may map to `503 Service Unavailable`.
- Unexpected server failures map to an appropriate `5xx` problem response.

Use `ProblemDetails` or `ValidationProblemDetails` with a clear title and safe detail. Do not return exception text, stack traces, database details, or internal paths to the client.

## Swagger and XML documentation

Controller documentation is part of the public API contract. Every controller requires a summary. Every endpoint requires:

- a concise `<summary>`;
- `<remarks>` when callers need usage or sequencing information;
- `<param>` entries for parameters whose meaning is not fully conveyed by the name and type;
- a `<response code="...">` entry for each documented outcome;
- `[ProducesResponseType]` for the typed success response; and
- `[ProducesResponseType]` for validation and problem responses.

```csharp
/// <summary>
/// Checks whether the API and its database are available.
/// </summary>
/// <remarks>
/// Use this endpoint as a lightweight readiness check before calling other endpoints.
/// </remarks>
/// <response code="200">The API connected to the database successfully.</response>
/// <response code="503">The API could not connect to the database.</response>
[HttpGet(Name = nameof(GetStatus))]
[ProducesResponseType(
    typeof(GetStatusResponse),
    StatusCodes.Status200OK,
    Description = "The API and database are available.")]
[ProducesResponseType(
    typeof(ProblemDetails),
    StatusCodes.Status503ServiceUnavailable,
    Description = "The database is unavailable.")]
```

Keep XML response descriptions and `ProducesResponseType` descriptions consistent. Document actual behavior, not a planned response that the action never returns.

## Avoid

Do not put Entity Framework queries, file access, domain calculations, cross-handler orchestration, or response-shaping loops in a controller. Do not throw exceptions for expected validation or handler failures. Do not return successful HTTP results when `Success` is false.
