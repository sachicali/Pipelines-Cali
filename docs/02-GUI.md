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

## Memory Context

### GUI Memory Structure
The GUI memory is organized as follows:

- **GUI Root**
  - Type: GUI
  - Description: Root node for all GUI-related memory
  - Relations:
    - Connected to: Main Project Memory
    - Connected to: View Memories
    - Connected to: Controller Memories

- **View Memories**
  - Type: View
  - Description: Memory nodes for each view
  - Observations:
    - Stores view templates and partials
    - Tracks view usage statistics
    - Maintains view dependencies
  - Relations:
    - Connected to: GUI Root
    - Connected to: Layout Memories

- **Controller Memories**
  - Type: Controller
  - Description: Memory nodes for JavaScript controllers
  - Observations:
    - Stores controller logic
    - Tracks controller events
    - Maintains controller dependencies
  - Relations:
    - Connected to: GUI Root
    - Connected to: View Memories

### Memory Integration
The GUI system integrates with the project memory through:

1. **View Tracking**
   - Each view render is logged in memory with:
     - View name
     - Render time
     - Data context
     - User context

2. **Controller Events**
   - Controller events are stored in memory with:
     - Event type
     - Target element
     - Event data
     - Timestamp

3. **Asset Management**
   - Asset usage is tracked in memory with:
     - Asset type (CSS/JS)
     - Load time
     - Dependencies
     - Usage statistics

4. **User Interactions**
   - User interactions are stored in memory with:
     - Interaction type (click, hover, etc.)
     - Target element
     - Interaction data
     - Timestamp

### Memory Access Patterns
The GUI system accesses memory through:
- View rendering statistics
- Controller event logging
- Asset performance tracking
- User interaction analysis

### Example Memory Query
```ruby
# Query GUI memory for view statistics
dashboard_memory = Memory.query(
  type: 'View',
  name: 'dashboard/index'
)