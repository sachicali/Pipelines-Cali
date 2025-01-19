# spec/javascript/components/Header_spec.rb
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

RSpec.describe "Header Component Test", type: :request do
  it "should render the header with navigation links" do
    rendered_component = render_component(Header)
    expect(rendered_component).to include("Pipelines")
    expect(rendered_component).to include("Dashboard")
    expect(rendered_component).to include("Recommendations")
    expect(rendered_component).to include("Notifications")
    expect(rendered_component).to include("John Doe")
    expect(rendered_component).to include("Content Creator")
  end
end