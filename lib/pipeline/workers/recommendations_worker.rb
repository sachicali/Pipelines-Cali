module Pipeline
  module Workers
    class RecommendationsWorker < BaseWorker
      sidekiq_options queue: :recommendations, 
                      retry: 3,
                      dead: false,
                      backtrace: true

      def perform(channel_id)
        log_start('recommendations', channel_id)
        
        analysis_data = fetch_from_cache('analysis', channel_id)
        recommendations = generate_recommendations(analysis_data)
        
        store_in_cache('recommendations', channel_id, recommendations)
        notify_completion(channel_id)
      rescue => e
        log_error('recommendations', channel_id, e)
        raise
      end

      private

      def generate_recommendations(analysis_data)
        engine = YouTubeRecommendationsEngine.new(
          OpenStruct.new(analyze: analysis_data)
        )
        engine.generate_recommendations
      end

      def notify_completion(channel_id)
        NotificationWorker.perform_async(
          channel_id, 
          'recommendations_complete',
          cache_key('recommendations', channel_id)
        )
      end
    end
  end
end 