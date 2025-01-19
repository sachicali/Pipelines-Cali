# spec/javascript/components/MetricsCard_spec.rb
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

RSpec.describe "MetricsCard Component Test", type: :request do
  it "should render metric information" do
    metric = {
      id: "test-metric",
      title: "Test Metric",
      value: 123,
      description: "This is a test metric",
      trend: 10
    }
    rendered_component = render_component(MetricsCard, { metric: metric })
    expect(rendered_component).to include("123")
    expect(rendered_component).to include("Test Metric")
    expect(rendered_component).to include("This is a test metric")
    expect(rendered_component).to include("▲ 10%")
  end

  it "should render loading state" do
    metric = {
      isLoading: true
    }
    rendered_component = render_component(MetricsCard, { metric: metric })
    expect(rendered_component).to include("animate-pulse")
  end

  it "should render no data state" do
    rendered_component = render_component(MetricsCard, {})
    expect(rendered_component).to include("No metric data available")
  end

  it "should render unable to load state" do
     metric = {
      title: "Test Metric",
    }
    rendered_component = render_component(MetricsCard, { metric: metric })
    expect(rendered_component).to include("Unable to load metric")
  end
end