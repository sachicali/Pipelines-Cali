# spec/javascript/components/RecommendationPopup_spec.rb
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

RSpec.describe "RecommendationPopup Component Test", type: :request do
  it "should render positive recommendations when trend is positive" do
    position = { x: 100, y: 200 }
    metric = { title: "Test Metric", trend: 1 }
    
    rendered_component = render_component(RecommendationPopup, { position: position, metric: metric })
    
    expect(rendered_component).to include("Your recent video series is performing exceptionally well")
    expect(rendered_component).to include("Engagement from your loyal subscribers is increasing")
    expect(rendered_component).to include("Consider creating more content in this style")
  end

  it "should render negative recommendations when trend is negative" do
    position = { x: 100, y: 200 }
    metric = { title: "Test Metric", trend: -1 }

    rendered_component = render_component(RecommendationPopup, { position: position, metric: metric })

    expect(rendered_component).to include("Review your recent content strategy")
    expect(rendered_component).to include("Consider experimenting with new formats")
    expect(rendered_component).to include("Engage more with your audience in comments")
  end
end