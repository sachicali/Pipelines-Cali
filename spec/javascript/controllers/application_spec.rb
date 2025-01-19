# spec/javascript/controllers/application_spec.rb
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

RSpec.describe "Application Controller Test", type: :request do
  it "should initialize the Stimulus application" do
    expect(window.Stimulus).to be_truthy
  end
end