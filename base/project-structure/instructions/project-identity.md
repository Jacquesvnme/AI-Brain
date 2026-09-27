# Identity Project

The Identity project contains reusable authentication and authorization behavior. It is a class library rather than an executable and is normally consumed by the API project or, when required, the Desktop project.

The structure below is an initial default. Keep smaller implementations compact and add the optional directories only when the identity implementation requires them.

Replace `PROJECT_NAME` with the actual project name throughout the structure.

## Expected structure

```text
PROJECT_NAME.Identity/
├── Authentication/
│   └── AccessKeys/
│       ├── AccessKeyAuthenticationHandler.cs
│       └── AccessKeyAuthenticationOptions.cs
├── Authorization/
├── Claims/
├── Controllers/
│   └── AuthenticatedControllerBase.cs
├── DependencyInjection.cs
└── PROJECT_NAME.Identity.csproj
```

## Directory responsibilities

### Authentication

The `Authentication` directory contains authentication schemes and the classes required to validate credentials and create authenticated principals. Group each authentication mechanism into its own directory when more than one mechanism exists.

For access-key authentication, `AccessKeyAuthenticationOptions.cs` defines the scheme options, header name, and configured access key. `AccessKeyAuthenticationHandler.cs` validates the supplied key and constructs the applicable claims identity and principal.

The `Handler` suffix in this filename refers to the ASP.NET Core authentication framework. It is not an API application handler and does not belong under the API project's `Handlers` directory.

### Authorization

The `Authorization` directory contains authorization policies, requirements, and related classes when the application needs behavior beyond basic authentication.

### Claims

The `Claims` directory contains reusable claim definitions, claim creation, or claim transformation behavior when those responsibilities become large enough to separate from an authentication mechanism.

### Controllers

The `Controllers` directory contains identity-related controller base classes. `AuthenticatedControllerBase.cs` inherits the ASP.NET Core `ControllerBase` and supplies shared top-level authentication or authorization behavior. Protected API controllers can then inherit `AuthenticatedControllerBase`.

## Root files

`DependencyInjection.cs` registers the authentication schemes, authorization policies, options, and other Identity services needed by the consuming host.
