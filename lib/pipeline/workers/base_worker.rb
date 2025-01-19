require_relative '../../../app/models/concerns/cacheable'

require 'active_support/concern'

module Pipeline
  module Workers
    class BaseWorker
      include ActiveSupport::Concern
      include Sidekiq::Worker
      include ::Cacheable
      include Loggable

      private

      

      def log_start(operation, id)
        Pipeline.logger.info "Starting #{operation} for ID: #{id}"
      end

      def log_error(operation, id, error)
        Pipeline.logger.error "#{operation} failed for ID: #{id}: #{error.message}"
        Pipeline.logger.error error.backtrace.join("\n")
      end
    end
  end
end 