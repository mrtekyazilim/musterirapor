const config = {
  apiUrl: import.meta.env.VITE_API_URL || 'http://localhost:13401/api',
  isProd: import.meta.env.PROD,
  isDev: import.meta.env.DEV,
}

export default config
