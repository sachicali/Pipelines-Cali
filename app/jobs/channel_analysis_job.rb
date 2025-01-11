class ChannelAnalysisJob < ApplicationJob
  queue_as :default

  def perform(channel_id)
    analytics = Pipeline::YouTubeAnalytics.new(Pipeline.configuration.youtube_api_key)
    analyzer = Pipeline::YouTubeChannelAnalyzer.new(channel_id, analytics.service)
    results = analyzer.analyze
    
    Turbo::StreamsChannel.broadcast_replace_to(
      "channel_#{channel_id}",
      target: "metrics",
      partial: "dashboard/metrics",
      locals: { metrics: results[:performance_metrics] }
    )
  end
end 