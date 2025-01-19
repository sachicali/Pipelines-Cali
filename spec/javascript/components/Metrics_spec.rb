# spec/javascript/components/Metrics_spec.rb
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

RSpec.describe "Metrics Component Test", type: :request do
  it "should render a line chart with positive trend" do
    metric = {
      name: "Test Metric",
      trend: 1,
      chartData: [
        { day: "Day 1", value: 10 },
        { day: "Day 2", value: 20 },
        { day: "Day 3", value: 15 }
      ]
    }
    rendered_component = render_component(Metrics, { metric: metric })
    expect(rendered_component).to include('<svg')
  end

  it "should render a line chart with negative trend" do
    metric = {
      name: "Test Metric",
      trend: -1,
      chartData: [
        { day: "Day 1", value: 10 },
        { day: "Day 2", value: 5 },
        { day: "Day 3", value: 8 }
      ]
    }
    rendered_component = render_component(Metrics, { metric: metric })
     expect(rendered_component).to include('<svg')
  end
end