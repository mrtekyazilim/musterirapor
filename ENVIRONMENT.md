# Environment Configuration Guide

## Overview

RaporKolay uses Vite's environment variables system for different deployment environments.

## Environment Files

### Admin Panel (`adminpanel/`)

- `.env.development` - Used when running `yarn dev`
  - API: http://localhost:13301/api
  - Client URL: http://localhost:13303

- `.env.production` - Used when running `yarn build`
  - API: https://kernel.raporkolay.com/api
  - Client URL: https://app.raporkolay.com

### Client (`client/`)

- `.env.development` - Used when running `yarn dev`
  - API: http://localhost:13301/api

- `.env.production` - Used when running `yarn build`
  - API: https://kernel.raporkolay.com/api

## Usage in Code

Import the config file:

```typescript
import { config } from "./config"

// Use config values
axios.get(`${config.apiUrl}/endpoint`)

// Check environment
if (config.isProd) {
  // Production-specific code
}
```

## Build Process

When you run `yarn build`, Vite automatically:

1. Reads `.env.production` file
2. Replaces all `import.meta.env.VITE_*` references
3. Bundles with production URLs

When you run `yarn dev`, Vite uses `.env.development`.

## Updating Client URLs

**IMPORTANT**: Client project still has hardcoded `http://localhost:13401` URLs that need to be migrated to use `config.apiUrl`.

Files to update:

- `client/src/pages/Connectors.tsx`
- `client/src/pages/ChatReports.tsx`
- `client/src/pages/ReportDesigns.tsx`
- `client/src/pages/ReportExecute.tsx`
- `client/src/pages/ReportForm.tsx`
- `client/src/pages/Reports.tsx`
- `client/src/pages/Sessions.tsx`
- `client/src/components/Layout.tsx`

Replace all instances of `'http://localhost:13401/api'` with `config.apiUrl`.

## Note

The port number changed from 13401 to 13301 in localhost. Update your kernel to run on 13301 or adjust .env.development files accordingly.
