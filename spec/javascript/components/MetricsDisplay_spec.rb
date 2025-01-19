# spec/javascript/components/MetricsDisplay_spec.rb
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

RSpec.describe "MetricsDisplay Component Test", type: :request do
  it "should render loading state" do
    rendered_component = render_component(MetricsDisplay, { isLoading: true })
    expect(rendered_component).to include("animate-pulse")
  end

  it "should render no metrics message" do
    rendered_component = render_component(MetricsDisplay, { metrics: [] })
    expect(rendered_component).to include("No metrics available")
  end

  it "should render metrics cards" do
    metrics = [
      { id: "metric-1", name: "Metric 1", value: 100 },
      { id: "metric-2", name: "Metric 2", value: 200 }
    ]
    rendered_component = render_component(MetricsDisplay, { metrics: metrics })
    expect(rendered_component).to include("Metric 1")
    expect(rendered_component).to include("Metric 2")
  end

  it "should render selected metric popup" do
    metrics = [
      { id: "metric-1", name: "Metric 1", value: 100, chartData: [{day: "Day 1", value: 10}] },
    ]
    rendered_component = render_component(MetricsDisplay, { metrics: metrics, selectedMetric: metrics[0] })
     expect(rendered_component).to include("Metric 1 Analysis")
     expect(rendered_component).to include("<svg")
  end
end