# spec/javascript/components/Chart_spec.rb
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

RSpec.describe "Chart Component Test", type: :request do
  it "should render a line chart" do
    data = {
      labels: ['January', 'February', 'March'],
      datasets: [{
        label: 'Test Data',
        data: [10, 20, 15],
        borderColor: 'rgb(75, 192, 192)',
        tension: 0.1
      }]
    }
    rendered_component = render_component(Chart, { type: 'line', data: data })
    expect(rendered_component).to include('<canvas')
  end

  it "should render a bar chart" do
    data = {
      labels: ['January', 'February', 'March'],
      datasets: [{
        label: 'Test Data',
        data: [10, 20, 15],
        backgroundColor: 'rgb(255, 99, 132)',
      }]
    }
    rendered_component = render_component(Chart, { type: 'bar', data: data })
    expect(rendered_component).to include('<canvas')
  end
end