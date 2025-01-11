class DashboardController < ApplicationController
  def index
    @channel_id = params[:channel_id] || 'UCX6OQ3DkcsbYNE6H8uQQuVA'
    @analytics = Pipeline::YouTubeAnalytics.new(Pipeline.configuration.youtube_api_key)
    @analyzer = Pipeline::YouTubeChannelAnalyzer.new(@channel_id, @analytics.service)
    @results = @analyzer.analyze
  end

  def grid
    @channel_id = params[:channel_id] || 'UCX6OQ3DkcsbYNE6H8uQQuVA'
    @analytics = Pipeline::YouTubeAnalytics.new(Pipeline.configuration.youtube_api_key)
    @analyzer = Pipeline::YouTubeChannelAnalyzer.new(@channel_id, @analytics.service)
    @results = @analyzer.analyze
  end
end 