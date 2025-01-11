module Pipeline
  module Workers
    class DataVisualizationWorker < BaseWorker
      sidekiq_options queue: :visualization, 
                      retry: 3,
                      dead: false,
                      backtrace: true

      def perform(channel_id)
        log_start('visualization', channel_id)
        
        analysis_data = fetch_from_cache('analysis', channel_id)
        dashboard = generate_dashboard(analysis_data)
        
        store_in_cache('dashboard', channel_id, dashboard)
        notify_completion(channel_id)
      rescue => e
        log_error('visualization', channel_id, e)
        raise
      end

      private

      def generate_dashboard(analysis_data)
        visualizer = YouTubeDataVisualizer.new(analysis_data)
        visualizer.generate_dashboard
      end

      def notify_completion(channel_id)
        NotificationWorker.perform_async(
          channel_id, 
          'visualization_complete',
          cache_key('dashboard', channel_id)
        )
      end
    end
  end
end 