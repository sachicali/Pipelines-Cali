# GUI Documentation

## 1. Architecture Overview

### 1.1 Component Structure
```mermaid
reference: gui-architecture
```

The GUI is built using:
- React components for dynamic interfaces
- Stimulus controllers for behavior
- ERB templates for layouts
- Tailwind CSS for styling

### 1.2 Component Interactions
```mermaid
reference: component-interactions
```

## 2. Frontend Components

### 2.1 React Components
Located in `app/javascript/components/`:
```typescript
// Dashboard.tsx
interface DashboardProps {
  channelId: string;
  metrics: MetricData[];
}

const Dashboard: React.FC<DashboardProps> = ({ channelId, metrics }) => {
  // Component implementation
};
```

### 2.2 Stimulus Controllers
Located in `app/javascript/controllers/`:
```javascript
// chart_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["chart", "data"]
  
  initialize() {
    // Controller initialization
  }
}
```

## 3. View Templates

### 3.1 Layouts
- `application.html.erb`: Main application layout
- `mailer.html.erb`: Email template layout
- `mailer.text.erb`: Plain text email layout

### 3.2 Dashboard Views
- `dashboard/index.html.erb`: Main dashboard
- `dashboard/_metrics.html.erb`: Metrics partial
- `dashboard/_channel_analytics.html.erb`: Analytics
- `dashboard/_recommendations.html.erb`: Recommendations

### 3.3 PWA Support
- `pwa/manifest.json.erb`: Progressive Web App manifest
- `pwa/service-worker.js`: Service worker
- `pwa/offline.html.erb`: Offline fallback page

## 4. Styling

### 4.1 Tailwind Configuration
```javascript
// tailwind.config.js
module.exports = {
  content: [
    './app/views/**/*.erb',
    './app/javascript/**/*.tsx'
  ],
  theme: {
    extend: {
      // Custom theme extensions
    }
  }
}
```

### 4.2 Component Styles
- `app/assets/stylesheets/components/*.css`
- Component-specific styles using Tailwind

## 5. Known Issues

### 5.1 Missing Implementations
- ❌ Incomplete TypeScript type definitions
- ❌ Missing component test coverage
- ❌ Incomplete error handling
- ❌ Missing accessibility features

### 5.2 Performance Issues
- Large bundle size for charts
- Delayed hydration on complex pages
- Memory leaks in some components

## 6. Development Guidelines

### 6.1 Component Creation
```typescript
// Template for new components
import React from 'react';
import { useChannel } from '@/hooks/useChannel';

interface ComponentProps {
  // Define props
}

export const Component: React.FC<ComponentProps> = (props) => {
  // Implementation
};
```

### 6.2 Controller Creation
```javascript
// Template for Stimulus controllers
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = []
  static values = {}
  
  connect() {
    // Implementation
  }
}
```

## 7. Testing

### 7.1 React Components
```typescript
// Component test template
import { render, screen } from '@testing-library/react'
import { Component } from './Component'

describe('Component', () => {
  it('renders correctly', () => {
    render(<Component />)
    // Assertions
  })
})
```

### 7.2 Stimulus Controllers
```javascript
// Controller test template
import { Application } from "@hotwired/stimulus"
import Controller from "./controller"

describe("Controller", () => {
  it("initializes correctly", () => {
    // Test implementation
  })
})
```

## 8. Best Practices

### 8.1 Performance
- Use React.memo for pure components
- Implement code splitting
- Optimize bundle size
- Use proper loading states

### 8.2 Accessibility
- Implement ARIA attributes
- Ensure keyboard navigation
- Maintain focus management
- Test with screen readers

## 9. Documentation

### 9.1 Component Documentation
```typescript
/**
 * @component
 * @example
 * <MetricsCard 
 *   metric={metricData}
 *   onUpdate={handleUpdate}
 * />
 */
```

### 9.2 Controller Documentation
```javascript
/**
 * @stimulus chart
 * @target chart The chart container element
 * @target data The data source element
 */
```

## Notes
- All React components use TypeScript
- Stimulus controllers handle DOM interactions
- ERB templates provide server-rendered structure
- CSS uses Tailwind utility classes