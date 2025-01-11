module Pipeline
  module Workers
    class BaseWorker
      include Sidekiq::Worker

      private

      def cache_key(type, id)
        "pipeline:#{type}:#{id}"
      end

      def store_in_cache(type, id, data)
        Rails.cache.write(
          cache_key(type, id),
          data,
          expires_in: Pipeline.configuration.cache_ttl
        )
      end

      def fetch_from_cache(type, id)
        Rails.cache.read(cache_key(type, id)) or
          raise StorageError, "#{type.capitalize} data not found for ID: #{id}"
      end

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