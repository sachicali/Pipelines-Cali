# spec/javascript/controllers/metrics_controller_spec.rb
require 'rails_helper'

def render_component(component, props = {}, content = '')
  ApplicationController.render(
    template: 'layouts/_component',
    layout: false,
    assigns: {
      component: component,
      props: props,
      content: content
    }
  )
end

RSpec.describe "Metrics Controller Test", type: :request do
  it "should set initial ARIA attributes" do
    rendered_component = render_component(
      'div',
      { 'data-controller': 'metrics' },
      '<div></div>'
    )
    expect(rendered_component).to include('role="region"')
    expect(rendered_component).to include('aria-label="Channel Metrics"')
  end

  it "should set loading state" do
    rendered_component = render_component(
      'div',
      { 'data-controller': 'metrics', 'data-metrics-loading-class': 'loading' },
      '<div></div>'
    )
    
    element = Nokogiri::HTML(rendered_component).at_css('div[data-controller="metrics"]')
    
    expect(element['class']).to_not include('loading')
    
    rendered_component = render_component(
      'div',
      { 'data-controller': 'metrics', 'data-metrics-loading-class': 'loading' },
      '<div data-action="metrics#setLoading:true"></div>'
    )
    
    element = Nokogiri::HTML(rendered_component).at_css('div[data-controller="metrics"]')
    expect(element['class']).to include('loading')
    expect(element['aria-busy']).to eq('true')

    rendered_component = render_component(
      'div',
      { 'data-controller': 'metrics', 'data-metrics-loading-class': 'loading' },
      '<div data-action="metrics#setLoading:false"></div>'
    )
    
    element = Nokogiri::HTML(rendered_component).at_css('div[data-controller="metrics"]')
    expect(element['class']).to_not include('loading')
    expect(element['aria-busy']).to eq('false')
  end

  it "should handle error state" do
    rendered_component = render_component(
      'div',
      { 'data-controller': 'metrics', 'data-metrics-error-class': 'error' },
      '<div data-action="metrics#handleError"></div>'
    )
    
    element = Nokogiri::HTML(rendered_component).at_css('div[data-controller="metrics"]')
    expect(element['class']).to include('error')
    expect(element['aria-invalid']).to eq('true')
    expect(rendered_component).to include('Error loading metrics. Please try again later.')
  end
end