# Architecture

Wiffy is a .NET 10 and React client-management application. `Wiffy.Api` is the executable HTTP host; MediatR handlers implement application operations. `Wiffy.Domain` contains shared user contracts and the client-description enum. `Wiffy.Infrastructure` owns Entity Framework Core, SQLite persistence, schema initialization, and seed data. `Wiffy.UI` is a Vite React TypeScript single-page application. `Wiffy.Identity` reserves the authentication boundary, and `Wiffy.Test` contains automated tests.
