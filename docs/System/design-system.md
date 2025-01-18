
# Pipeline Design System

## Core Principles

### 1. Minimalistic Design Philosophy
- Focus on essential content
- Remove unnecessary decorative elements
- Use whitespace effectively
- Progressive disclosure of information
- Clear visual hierarchy

### 2. Color System
```css
/* Base Colors */
--color-primary: #2563eb;     /* Blue 600 */
--color-surface: #ffffff;     /* White */
--color-background: #f8fafc;  /* Slate 50 */
--color-text: #0f172a;       /* Slate 900 */

/* Dark Mode Colors */
--color-surface-dark: #1e293b;    /* Slate 800 */
--color-background-dark: #0f172a;  /* Slate 900 */
--color-text-dark: #f8fafc;       /* Slate 50 */

/* Semantic Colors */
--color-success: #059669;    /* Emerald 600 */
--color-error: #dc2626;      /* Red 600 */
--color-warning: #d97706;    /* Amber 600 */
```

### 3. Typography
```css
/* Font Scale */
--font-xs: 0.75rem;    /* 12px */
--font-sm: 0.875rem;   /* 14px */
--font-base: 1rem;     /* 16px */
--font-lg: 1.125rem;   /* 18px */
--font-xl: 1.25rem;    /* 20px */
--font-2xl: 1.5rem;    /* 24px */
--font-3xl: 1.875rem;  /* 30px */

/* Font Weights */
--font-normal: 400;
--font-medium: 500;
--font-semibold: 600;
--font-bold: 700;
```

### 4. Spacing System
```css
/* Spacing Scale */
--space-1: 0.25rem;   /* 4px */
--space-2: 0.5rem;    /* 8px */
--space-3: 0.75rem;   /* 12px */
--space-4: 1rem;      /* 16px */
--space-6: 1.5rem;    /* 24px */
--space-8: 2rem;      /* 32px */
--space-12: 3rem;     /* 48px */
--space-16: 4rem;     /* 64px */
```

## Component Patterns

### 1. Card Components
```erb
<article class="card">
  <div class="card-content">
    <header class="card-header">
      <h3 class="card-title">...</h3>
      <p class="card-subtitle">...</p>
    </header>
    <div class="card-body">...</div>
  </div>
</article>
```

### 2. Metric Display
```erb
<div class="metric">
  <dt class="metric-label">...</dt>
  <dd class="metric-value">...</dd>
  <p class="metric-description">...</p>
</div>
```

### 3. Chart Containers
```erb
<section class="chart-container">
  <header class="chart-header">
    <h3 class="chart-title">...</h3>
    <div class="chart-controls">...</div>
  </header>
  <div class="chart-content">...</div>
</section>
```

## React Integration

### 1. Component Structure
```jsx
// Base Component Pattern
const MetricCard = ({ title, value, description }) => (
  <article className="metric-card">
    <dt className="metric-title">{title}</dt>
    <dd className="metric-value">{value}</dd>
    <p className="metric-description">{description}</p>
  </article>
);

// Container Component Pattern
const MetricsGrid = ({ metrics }) => (
  <section className="metrics-grid">
    {metrics.map(metric => (
      <MetricCard key={metric.id} {...metric} />
    ))}
  </section>
);
```

### 2. State Management
```jsx
// Use React Query for API data
const useMetrics = (channelId) => {
  return useQuery(['metrics', channelId], () => 
    fetchMetrics(channelId)
  );
};

// Local state with hooks
const useTheme = () => {
  const [theme, setTheme] = useState('light');
  // Theme toggle logic
  return { theme, toggleTheme };
};
```

## Hanami-Inspired Architecture

### 1. Directory Structure
```
app/
├── controllers/
│   └── dashboard/
│       ├── index.rb
│       └── operations/
├── views/
│   └── dashboard/
│       ├── index.rb
│       └── parts/
└── assets/
    └── javascripts/
        └── components/
```

### 2. View Objects
```ruby
# app/views/dashboard/index.rb
module Views
  module Dashboard
    class Index < View::Base
      def metrics
        MetricsPart.new(raw: metrics_data)
      end
    end
  end
end
```

### 3. Operations
```ruby
# app/controllers/dashboard/operations/fetch_metrics.rb
module Dashboard
  module Operations
    class FetchMetrics < Operation
      def call(channel_id:)
        Result.new(
          metrics: analyzer.analyze(channel_id)
        )
      end
    end
  end
end
```

## Accessibility Guidelines

### 1. ARIA Attributes
- Use proper landmarks
- Provide descriptive labels
- Maintain focus management
- Support keyboard navigation

### 2. Color Contrast
- Maintain WCAG 2.1 AA compliance
- Test color combinations
- Provide sufficient contrast ratios

## Performance Guidelines

### 1. Component Loading
- Implement lazy loading
- Use skeleton screens
- Optimize bundle size

### 2. Data Management
- Implement proper caching
- Use optimistic updates
- Handle loading states gracefully