module Pipeline
  module Workers
    class ChannelAnalysisWorker < BaseWorker
      include Loggable
      sidekiq_options queue: :analysis,
                      retry: 3,
                      dead: false,
                      backtrace: true

      def perform(channel_id)
        log_start('analysis', channel_id)
        
        analysis_results = analyze_channel(channel_id)
        begin
          store_in_cache('analysis', channel_id, analysis_results)
        rescue Pipeline::StorageError => e
          log_error('analysis', channel_id, e)
          raise
        end
        
        schedule_follow_up_jobs(channel_id)
      rescue StandardError => e
        log_error('analysis', channel_id, e)
        raise
      end

      private

      def analyze_channel(channel_id)
        analyzer = YouTubeChannelAnalyzer.new(channel_id)
        analyzer.analyze
      end

      def schedule_follow_up_jobs(channel_id)
        batch = Sidekiq::Batch.new
        batch.description = "Channel analysis follow-up jobs for #{channel_id}"
        
        batch.jobs do
          DataVisualizationWorker.perform_async(channel_id)
          RecommendationsWorker.perform_async(channel_id)
        end
      end
    end
  end
end 