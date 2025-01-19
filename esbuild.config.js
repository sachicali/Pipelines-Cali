const esbuild = require('esbuild')
const babel = require('esbuild-plugin-babel').default
const path = require('path')
const postcss = require('postcss')
const tailwindcss = require('tailwindcss')
const autoprefixer = require('autoprefixer')

// JavaScript/TypeScript build
esbuild.build({
  entryPoints: ['app/javascript/application.tsx'],
  bundle: true,
  sourcemap: true,
  outdir: 'app/assets/builds/js',
  publicPath: '/assets',
  entryNames: '[dir]/[name]-[hash]',
  plugins: [
    babel({
      filter: /\.(tsx|ts)$/,
      config: {
        presets: [
          '@babel/preset-typescript',
          '@babel/preset-react'
        ],
        plugins: [
          '@babel/plugin-transform-runtime'
        ]
      }
    })
  ],
  define: {
    'process.env.NODE_ENV': JSON.stringify(process.env.NODE_ENV || 'development')
  },
  // Watch mode is handled by esbuild context
  minify: process.env.NODE_ENV === 'production',
  loader: {
    '.ts': 'ts',
    '.tsx': 'tsx'
  },
  outExtension: { '.js': '.js' },
  sourceRoot: 'app/javascript',
  sourcesContent: false
}).catch(() => process.exit(1))

// CSS build
esbuild.build({
  entryPoints: ['app/assets/stylesheets/application.tailwind.css'],
  bundle: true,
  outdir: 'app/assets/builds/css',
  loader: {
    '.css': 'css'
  },
  plugins: [
    {
      name: 'postcss',
      setup(build) {
        build.onLoad({ filter: /\.css$/ }, async (args) => {
          const css = await require('fs').promises.readFile(args.path, 'utf8')
          const result = await postcss([
            tailwindcss,
            autoprefixer
          ]).process(css, {
            from: args.path,
            to: args.path
          })
          return {
            contents: result.css,
            loader: 'css'
          }
        })
      }
    }
  ]
}).catch(() => process.exit(1))
