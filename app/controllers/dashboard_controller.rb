class DashboardController < ApplicationController
  def index
    @channel_id = params[:channel_id] || 'UCX6OQ3DkcsbYNE6H8uQQuVA'
    @analytics = Pipeline::YouTubeAnalytics.new(Pipeline.configuration.youtube_api_key)
    @analyzer = Pipeline::YouTubeChannelAnalyzer.new(@channel_id, @analytics.service)
    
    metrics = @analyzer.analyze
    @metrics_data = {
      average_views: metrics[:average_views].round,
      view_growth_rate: metrics[:view_growth_rate],
      engagement_rate: metrics[:engagement_rates][:overall]
    }

    respond_to do |format|
      format.html
      format.json { render json: @metrics_data }
    end
  end
end