# spec/javascript/components/Navbar_spec.rb

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

RSpec.describe "Navbar Component Test", type: :request do
  it "should render the navbar with navigation links" do
    rendered_component = render_component(Navbar)
    expect(rendered_component).to include("Pipelines")
    expect(rendered_component).to include("Dashboard")
    expect(rendered_component).to include("Recommendations")
    expect(rendered_component).to include("Notifications")
  end
end