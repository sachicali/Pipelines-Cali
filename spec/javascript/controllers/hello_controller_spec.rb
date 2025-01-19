# spec/javascript/controllers/hello_controller_spec.rb
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

RSpec.describe "Hello Controller Test", type: :request do
  it "should set the text content to 'Hello World!'" do
    rendered_component = render_component(
      'div',
      { 'data-controller': 'hello' },
      '<div></div>'
    )
    expect(rendered_component).to include("Hello World!")
  end
end