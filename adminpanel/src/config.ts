export const config = {
  apiUrl: import.meta.env.VITE_API_URL || 'http://localhost:13301/api',
  clientUrl: import.meta.env.VITE_CLIENT_URL || 'http://localhost:13303',
  isProd: import.meta.env.PROD,
  isDev: import.meta.env.DEV,
}
