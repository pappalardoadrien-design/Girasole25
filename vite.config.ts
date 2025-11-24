import { defineConfig } from 'vite'
import pages from '@hono/vite-cloudflare-pages'

export default defineConfig({
  plugins: [
    pages({
      // Configure Cloudflare Pages routing
      // Exclude /documents* from Worker - serve statically
      output: {
        adapter: {
          exclude: ['/static/*', '/documents*']
        }
      }
    })
  ],
  build: {
    outDir: 'dist'
  }
})
