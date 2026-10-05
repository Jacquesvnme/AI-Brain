# Backend

The API exposes RESTful CRUD operations for users and an aggregate statistics endpoint. Controllers validate transport input and dispatch one MediatR command or query. Handlers map persistence entities to domain models and return explicit success and message outcomes. SQLite uses an application-owned GUID, manual order, and UTC creation and modification timestamps for each user.
