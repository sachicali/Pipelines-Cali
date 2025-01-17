# GUI Documentation

## 1. Views

### 1.1 Main Layouts
- `app/views/layouts/application.html.erb` - Main application layout
- `app/views/layouts/mailer.html.erb` - Email layout
- `app/views/layouts/mailer.text.erb` - Plain text email layout

### 1.2 Dashboard Views
- `app/views/dashboard/index.html.erb` - Main dashboard view
- `app/views/dashboard/_metrics.html.erb` - Metrics partial
- `app/views/dashboard/_channel_analytics.html.erb` - Channel analytics partial
- `app/views/dashboard/_recommendations.html.erb` - Recommendations partial

### 1.3 PWA Views
- `app/views/pwa/manifest.json.erb` - PWA manifest
- `app/views/pwa/service-worker.js` - Service worker
- `app/views/pwa/offline.html.erb` - Offline fallback page

## 2. JavaScript Controllers

### 2.1 Stimulus Controllers
- `app/javascript/controllers/application.js` - Main Stimulus application
- `app/javascript/controllers/chart_controller.js` - Chart controller
- `app/javascript/controllers/dashboard_controller.js` - Dashboard controller
- `app/javascript/controllers/analytics_controller.js` - Analytics controller
- `app/javascript/controllers/index.js` - Controller index

### 2.2 Public JavaScript
- `public/css/js/charts.js` - Charting utilities
- `public/css/js/dashboard.js` - Dashboard utilities
- `public/css/js/grid.js` - Grid utilities
- `public/css/js/analytics.js` - Analytics utilities

## 3. CSS/Assets
- `app/assets/stylesheets/application.tailwind.css` - Main stylesheet
- `public/css/styles.css` - Compiled CSS
- `app/assets/stylesheets/components/` - Component-specific styles
  - `_charts.css` - Chart styles
  - `_dashboard.css` - Dashboard styles
  - `_analytics.css` - Analytics styles

## 4. Memory Context

### 4.1 GUI Memory Structure
The GUI memory is organized as follows:

- **4.1.1 GUI Root**
  - Type: GUI
  - Description: Root node for all GUI-related memory
  - Relations:
    - Connected to: Main Project Memory
    - Connected to: View Memories
    - Connected to: Controller Memories

- **4.1.2 View Memories**
  - Type: View
  - Description: Memory nodes for each view
  - Observations:
    - Stores view templates and partials
    - Tracks view usage statistics
    - Maintains view dependencies
  - Relations:
    - Connected to: GUI Root
    - Connected to: Layout Memories

- **4.1.3 Controller Memories**
  - Type: Controller
  - Description: Memory nodes for JavaScript controllers
  - Observations:
    - Stores controller logic
    - Tracks controller events
    - Maintains controller dependencies
  - Relations:
    - Connected to: GUI Root
    - Connected to: View Memories

### 4.2 Memory Integration
The GUI system integrates with the project memory through:

1.  **4.2.1 View Tracking**
   - Each view render is logged in memory with:
     - View name
     - Render time
     - Data context
     - User context

2.  **4.2.2 Controller Events**
   - Controller events are stored in memory with:
     - Event type
     - Target element
     - Event data
     - Timestamp

3.  **4.2.3 Asset Management**
   - Asset usage is tracked in memory with:
     - Asset type (CSS/JS)
     - Load time
     - Dependencies
     - Usage statistics

4.  **4.2.4 User Interactions**
   - User interactions are stored in memory with:
     - Interaction type (click, hover, etc.)
     - Target element
     - Interaction data
     - Timestamp

### 4.3 Memory Access Patterns
The GUI system accesses memory through:
- View rendering statistics
- Controller event logging
- Asset performance tracking
- User interaction analysis

### 4.4 Example Memory Query
```ruby
# Query GUI memory for view statistics
dashboard_memory = Memory.query(
  type: 'View',
  name: 'dashboard/index'
)

# Query GUI memory for controller events
analytics_controller_memory = Memory.query(
  type: 'Controller',
  name: 'analytics_controller'
)