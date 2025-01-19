# spec/javascript/components/CompetitorCard_spec.rb
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

RSpec.describe "CompetitorCard Component Test", type: :request do
  it "should render competitor information" do
    competitor = {
      name: "Test Competitor",
      subscribers: 1000,
      outlierVideos: [
        { title: "Video 1", views: 10000 },
        { title: "Video 2", views: 20000 }
      ]
    }
    rendered_component = render_component(CompetitorCard, { competitor: competitor })
    expect(rendered_component).to include("Test Competitor")
    expect(rendered_component).to include("Subscribers: 1000")
    expect(rendered_component).to include("Video 1")
    expect(rendered_component).to include("10000 views")
    expect(rendered_component).to include("Video 2")
    expect(rendered_component).to include("20000 views")
  end
end