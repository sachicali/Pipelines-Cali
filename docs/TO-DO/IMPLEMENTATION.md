# Rails-React-Hanami Implementation Guide

## Quick Start

1. Rails Controller (app/controllers/dashboard_controller.rb):
```ruby
class DashboardController < ApplicationController
  def index
    @metrics = {
      average_views: 1000,
      growth_rate: 15,
      engagement_rate: 8.5
    }
  end
end
```

2. React Component (app/javascript/components/Metrics.jsx):
```jsx
const Metrics = ({ data }) => (
  <div className="grid grid-cols-3 gap-4">
    <div className="p-4 bg-white rounded">
      <div className="text-2xl">{data.average_views}</div>
      <div className="text-sm">Average Views</div>
    </div>
    {/* Similar cards for other metrics */}
  </div>
)
```

3. Rails View (app/views/dashboard/index.html.erb):
```erb
<div id="metrics-root" 
     data-metrics="<%= @metrics.to_json %>">
</div>

<%= javascript_tag do %>
  document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('metrics-root')
    const data = JSON.parse(root.dataset.metrics)
    ReactDOM.createRoot(root).render(
      React.createElement(Metrics, { data })
    )
  })
<% end %>
```

## Key Integration Points

1. Data Flow:
   - Rails controller prepares data
   - Data passed to view via instance variables
   - View embeds data as data attributes
   - React picks up data and renders UI

2. Component Mounting:
   - Use data attributes for configuration
   - Mount React components after DOM loads
   - Keep JavaScript minimal and focused

3. Styling:
   - Use Tailwind classes directly
   - Keep styles close to components
   - Maintain consistent spacing

## Testing

1. Rails Tests:
```ruby
# test/controllers/dashboard_controller_test.rb
class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index with metrics" do
    get dashboard_path
    assert_response :success
    assert_select "#metrics-root"
  end
end
```

2. React Tests:
```jsx
// test/javascript/components/Metrics.test.jsx
describe('Metrics', () => {
  it('renders metrics data', () => {
    const data = {
      average_views: 1000,
      growth_rate: 15
    }
    render(<Metrics data={data} />)
    expect(screen.getByText('1000')).toBeInTheDocument()
  })
})
```

## Common Issues & Solutions

1. React Not Loading:
   - Ensure JavaScript pack is included
   - Check browser console for errors
   - Verify data attributes are properly escaped

2. Styling Issues:
   - Confirm Tailwind classes are compiled
   - Check class naming conflicts
   - Verify responsive breakpoints

3. Performance:
   - Keep component updates minimal
   - Use proper key props in lists
   - Avoid unnecessary re-renders