# spec/javascript/components/MetricPopup_spec.rb
require 'rails_helper'

def render_component(component, props)
  ApplicationController.render(
    template: 'layouts/_component',
    layout: false,
    assigns: {
      component: component,
      props: props
    }
  )
end

RSpec.describe "MetricPopup Component Test", type: :request do
  it "should render positive analysis when trend is positive" do
    position = { x: 100, y: 200 }
    metric = { name: "Test Metric", trend: 1 }
    
    rendered_component = render_component(MetricPopup, { position: position, metric: metric })
    
    expect(rendered_component).to include("Your Test Metric is performing well!")
    expect(rendered_component).to include("Keep up the great work!")
  end

  it "should render negative analysis when trend is negative" do
    position = { x: 100, y: 200 }
    metric = { name: "Test Metric", trend: -1 }

    rendered_component = render_component(MetricPopup, { position: position, metric: metric })

    expect(rendered_component).to include("Your Test Metric is trending down.")
    expect(rendered_component).to include("Consider reviewing your content strategy.")
  end
end