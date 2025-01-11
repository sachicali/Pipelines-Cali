require 'sidekiq'
require 'sidekiq/batch'
require 'json'
require 'fileutils'

require_relative 'workers/base_worker'
require_relative 'workers/channel_analysis_worker'
require_relative 'workers/data_visualization_worker'
require_relative 'workers/recommendations_worker'
require_relative 'workers/notification_worker'

module Pipeline
  module Workers
    class << self
      def configure
        configure_sidekiq
        configure_batch
      end

      private

      def configure_sidekiq
        Sidekiq.configure_server do |config|
          config.redis = { url: Pipeline.configuration.redis_url }
          config.logger.level = Pipeline.configuration.log_level
        end

        Sidekiq.configure_client do |config|
          config.redis = { url: Pipeline.configuration.redis_url }
        end
      end

      def configure_batch
        Sidekiq::Batch.configure do |config|
          config.on_complete_callback = lambda do |status, options|
            channel_id = options['channel_id']
            NotificationWorker.perform_async(channel_id, 'analysis_complete')
          end
        end
      end
    end
  end
end 