# RaporKolay AI Instructions

## Big picture

- Monorepo: `kernel/` (Node.js + Express + MongoDB API), `adminpanel/` (React admin UI), `client/` (React PWA), `web/` (separate Vite React app).
- API is the hub: frontends talk to `kernel/` on port 13401 via Vite proxy (`/api`). Admin UI runs on 13402, client app on 13403, web app on 13404.
- Connector flow: client apps never call ConnectorAbi directly; all ConnectorAbi traffic is proxied through `kernel/` at `/api/connector-proxy/*`.

## Critical integration details

- Connector auth uses `clientId` + `clientPassword`; connector `clientPassword` is stored in plain text and compared via string equality (no hashing).
- ConnectorAbi base URL: https://kernel.connectorabi.com/api/v1; endpoints `/datetime`, `/mssql` (and backend proxy adds `/mysql`, `/pg`).
- Backend wraps connector responses as `{ success: true, data: connectorResponse }`, so recordsets are at `response.data.data.data.recordsets[0]` when using the proxy.
- ConnectorAbi direct response is `response.data.data.recordsets[0]`.

## Dev workflows (use Yarn only)

- `kernel/`: `yarn dev` (nodemon), `yarn start`, `yarn seed`.
- `adminpanel/`: `yarn dev`, `yarn build`, `yarn preview`.
- `client/`: `yarn dev`, `yarn build`, `yarn preview` (preview on 13404).
- `web/`: `yarn dev`, `yarn build`, `yarn preview`.

## Frontend conventions

- React + TypeScript + Tailwind + shadcn/ui; prefer hooks and functional components.
- Dark mode is required for every new UI element; keep the class set consistent (backgrounds, text, borders, inputs, modal overlays/footers, buttons, links).
- Default theme is `dark` in App components; persist to localStorage.

## Backend conventions

- Express middleware structure, Mongoose models, REST endpoints; use `.env` for config.
- `kernel/src/routes` defines API surface; `middleware/` holds auth and timing logic.

## Cross-app patterns

- Vite dev servers proxy `/api` to `http://localhost:13401` in adminpanel/client.
- Client PWA uses Workbox; runtime caching targets `http://localhost:13401/api/*` with NetworkFirst.
