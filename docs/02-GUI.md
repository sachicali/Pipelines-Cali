# GUI Documentation

## Views

### Main Layouts
- `app/views/layouts/application.html.erb` - Main application layout
- `app/views/layouts/mailer.html.erb` - Email layout
- `app/views/layouts/mailer.text.erb` - Plain text email layout

### Dashboard Views
- `app/views/dashboard/index.html.erb` - Main dashboard view
- `app/views/dashboard/_metrics.html.erb` - Metrics partial

### PWA Views
- `app/views/pwa/manifest.json.erb` - PWA manifest
- `app/views/pwa/service-worker.js` - Service worker

## JavaScript Controllers

### Stimulus Controllers
- `app/javascript/controllers/application.js` - Main Stimulus application
- `app/javascript/controllers/chart_controller.js` - Chart controller
- `app/javascript/controllers/hello_controller.js` - Example controller
- `app/javascript/controllers/index.js` - Controller index

### Public JavaScript
- `public/css/js/charts.js` - Charting utilities
- `public/css/js/dashboard.js` - Dashboard utilities
- `public/css/js/grid.js` - Grid utilities

## CSS/Assets
- `app/assets/stylesheets/application.tailwind.css` - Main stylesheet
- `public/css/styles.css` - Compiled CSS