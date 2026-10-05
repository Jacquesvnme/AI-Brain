# Pathing

The React UI calls the API through the Vite `/api` development proxy. User CRUD is exposed at `/api/users` and `/api/users/{id}`. Filter, sort, page, and page-size values are query parameters on `GET /api/users`. Aggregate user statistics are exposed at `GET /api/users/stats`.
