# spec/javascript/controllers/chart_controller_spec.rb
require 'rails_helper'

def render_component(component, props = {})
  ApplicationController.render(
    template: 'layouts/_component',
    layout: false,
    assigns: {
      component: component,
      props: props
    }
  )
end

RSpec.describe "Chart Controller Test", type: :request do
  it "should render a chart with data from dataset" do
    data = {
      labels: ['January', 'February', 'March'],
      datasets: [{
        label: 'Test Data',
        data: [10, 20, 15],
        borderColor: 'rgb(75, 192, 192)',
        tension: 0.1
      }]
    }
    
    rendered_component = render_component(
      'div',
      {
        'data-controller': 'chart',
        'data-chart-target': 'canvas',
        'data-chart-chart-data': data.to_json
      },
      '<canvas data-chart-target="canvas"></canvas>'
    )
    expect(rendered_component).to include('<canvas')
  end
end