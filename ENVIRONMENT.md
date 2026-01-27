# Environment Configuration Guide

## Overview

RaporKolay uses Vite's environment variables system for different deployment environments.

## Environment Files

### Admin Panel (`adminpanel/`)

- `.env.development` - Used when running `yarn dev`
  - API: http://localhost:13401/api
  - Client URL: http://localhost:13403

- `.env.production` - Used when running `yarn build`
  - API: https://kernel.raporkolay.com/api
  - Client URL: https://app.raporkolay.com

### Client (`client/`)

- `.env.development` - Used when running `yarn dev`
  - API: http://localhost:13401/api

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
