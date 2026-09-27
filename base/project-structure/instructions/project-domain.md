# Domain Project

The Domain project contains shared domain-facing types used throughout the system. Its standard internal structure separates enums, models, request types, response types, and value objects by responsibility.

Replace `PROJECT_NAME` with the actual project name throughout the structure.

## Expected structure

```text
PROJECT_NAME.Domain/
├── Enums/
├── Models/
├── Requests/
├── Responses/
├── ValueObjects/
└── PROJECT_NAME.Domain.csproj
```

## Project file

`PROJECT_NAME.Domain.csproj` does not require any special structural customization. Use the project file created by the standard Domain project-creation instructions unless a project-specific requirement calls for a change.

## Directory responsibilities

### Enums

The `Enums` directory contains public enum definitions used throughout the system for their applicable purposes.

### Models

The `Models` directory contains models used throughout the system for their applicable purposes.

### Requests

The `Requests` directory contains individual request classes. These requests are used primarily by controllers and other entry points that receive structured input.

### Responses

The `Responses` directory contains response classes used to return structured results from the system.

### ValueObjects

The `ValueObjects` directory contains smaller, focused models with specific reusable purposes. These types may be shared throughout the system or used as base classes that other types inherit and extend.

For example, a handler base response can define the common response information required by every handler. Individual handler responses can inherit that base response and add the information required by their specific operations.
