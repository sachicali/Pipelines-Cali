class ChannelAnalysisJob < ApplicationJob
  queue_as :default

  def perform(channel_id)
    begin
      analytics = Pipeline::YouTubeAnalytics.new(Pipeline.configuration.youtube_api_key)
      analyzer = Pipeline::YouTubeChannelAnalyzer.new(channel_id, analytics.service)
      results = analyzer.analyze
      
      Turbo::StreamsChannel.broadcast_replace_to(
        "channel_#{channel_id}",
        target: "metrics",
        partial: "dashboard/metrics",
        locals: { metrics: results[:performance_metrics] }
      )
    rescue Pipeline::Error => e
      Rails.logger.error("Pipeline Error analyzing channel #{channel_id}: #{e.message}\n#{e.backtrace.join("\n")}")
      Turbo::StreamsChannel.broadcast_replace_to(
        "channel_#{channel_id}",
        target: "metrics",
        partial: "dashboard/error",
        locals: { error: "Error analyzing channel: #{e.message}" }
      )
    rescue StandardError => e
      Rails.logger.error("Unexpected error analyzing channel #{channel_id}: #{e.message}\n#{e.backtrace.join("\n")}")
    end
  end
end 