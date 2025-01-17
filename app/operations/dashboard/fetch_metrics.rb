# frozen_string_literal: true

module Operations
  module Dashboard
    # FetchMetrics Operation
    # Handles the business logic for fetching and processing dashboard metrics
    # Following Hanami architecture patterns for clean separation of concerns
    class FetchMetrics
      include Pipeline::Operation

      # Dependencies
      attr_reader :analytics_service, :channel_analyzer

      def initialize
        @analytics_service = Pipeline::YouTubeAnalytics.new(Pipeline.configuration.youtube_api_key)
        @channel_analyzer = Pipeline::YouTubeChannelAnalyzer
      end

      # Main operation execution
      # @param channel_id [String] YouTube channel ID
      # @return [Result] Operation result with metrics data
      def call(channel_id:)
        Result.new(success: true) do |result|
          result.metrics = fetch_metrics(channel_id)
        end
      rescue StandardError => e
        Result.new(
          success: false,
          error: e.message
        )
      end

      private

      # Fetches and processes metrics data
      # @param channel_id [String] YouTube channel ID
      # @return [Hash] Processed metrics data
      def fetch_metrics(channel_id)
        analyzer = channel_analyzer.new(channel_id, analytics_service.service)
        analyzer.analyze
      end
    end
  end
end