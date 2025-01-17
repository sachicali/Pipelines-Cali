const esbuild = require('esbuild')

// Basic esbuild configuration for React
esbuild.build({
  entryPoints: ['app/javascript/application.js'],
  bundle: true,
  sourcemap: true,
  outdir: 'app/assets/builds',
  publicPath: '/assets',
  loader: {
    '.js': 'jsx'
  },
  define: {
    'process.env.NODE_ENV': JSON.stringify(process.env.NODE_ENV || 'development')
  },
  watch: process.argv.includes('--watch'),
  minify: process.env.NODE_ENV === 'production'
}).catch(() => process.exit(1))