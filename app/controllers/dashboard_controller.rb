class DashboardController < ApplicationController
  def index
    @channel_id = params[:channel_id] || "UCX6OQ3DkcsbYNE6H8uQQuVA"
    @analytics = Pipeline::YouTubeAnalytics.new(Pipeline.configuration.youtube_api_key)
    @analyzer = Pipeline::YouTubeChannelAnalyzer.new(@channel_id, @analytics.service)
  begin
    metrics = @analyzer.analyze
    @metrics_data = {
      average_views: metrics[:average_views].round,
      view_growth_rate: metrics[:view_growth_rate],
      engagement_rate: metrics[:engagement_rates][:overall]
    }
  rescue Pipeline::Error => e
    Rails.logger.error("Error fetching dashboard data: #{e.message}\n#{e.backtrace.join("\n")}")
    flash[:error] = "Error fetching dashboard data: #{e.message}"
    redirect_to root_path
  rescue StandardError => e
    Rails.logger.error("Unexpected error fetching dashboard data: #{e.message}\n#{e.backtrace.join("\n")}")
    flash[:error] = "Unexpected error fetching dashboard data"
    redirect_to root_path
  end

    # Data for React components
    @metrics = [
      { name: "Average Views", value: metrics[:average_views].round, trend: metrics[:view_growth_rate] },
      { name: "Engagement Rate", value: metrics[:engagement_rates][:overall], trend: 0 },
      { name: "Subscribers", value: metrics[:subscriber_count], trend: metrics[:subscriber_growth_rate] },
      { name: "Watch Time", value: metrics[:watch_time_minutes], trend: metrics[:watch_time_growth_rate] }
    ]

    @chart_data = metrics[:views_over_time].map do |date, views|
      { name: date.strftime("%b"), value: views }
    end

    @competitors = metrics[:competitor_analysis].map do |competitor|
      {
        name: competitor[:channel_title],
        subscribers: competitor[:subscriber_count],
        growth: competitor[:growth_rate]
      }
    end

    respond_to do |format|
      format.html
      format.json { render json: @metrics_data }
    end
  end
end
