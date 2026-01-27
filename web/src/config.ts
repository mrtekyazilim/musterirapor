const config = {
  clientAppUrl: import.meta.env.VITE_CLIENT_APP_URL || 'http://localhost:13403',
  isProd: import.meta.env.PROD,
  isDev: import.meta.env.DEV,
}

export default config
