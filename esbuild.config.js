const esbuild = require('esbuild')
const babel = require('esbuild-plugin-babel')

// Basic esbuild configuration for React
esbuild.build({
  entryPoints: ['app/javascript/application.js'],
  bundle: true,
  sourcemap: true,
  outdir: 'app/assets/builds',
  publicPath: '/assets',
  loader: {
    '.js': 'jsx',
    '.jsx': 'jsx',
    '.ts': 'tsx',
    '.tsx': 'tsx'
  },
  plugins: [
    babel({
      jsxFactory: 'React.createElement',
      jsxFragment: 'React.Fragment',
      plugins: [
        '@babel/plugin-transform-runtime'
      ]
    })
  ],
  define: {
    'process.env.NODE_ENV': JSON.stringify(process.env.NODE_ENV || 'development')
  },
  watch: process.argv.includes('--watch'),
  minify: process.env.NODE_ENV === 'production'
}).catch(() => process.exit(1))