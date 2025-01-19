module Pipeline
  module Services
    class CacheService
      def initialize
        @redis = Redis.new(url: Pipeline.configuration.redis_url)
      end
      
      def cache_key(type, id)
        "pipeline:#{type}:#{id}"
      end
      
      def fetch(type, id, expires_in: 1.hour)
        key = cache_key(type, id)
        begin
          cached = @redis.get(key)
          return JSON.parse(cached, symbolize_names: true) if cached
          
          result = yield
          @redis.setex(key, expires_in, result.to_json)
          result
        rescue StandardError => e
          Rails.logger.error("Error fetching from Redis cache for key #{key}: #{e.message}\n#{e.backtrace.join("\n")}")
          nil
        end
      end
      
      def clear(type, id)
        begin
          @redis.del(cache_key(type, id))
        rescue StandardError => e
          Rails.logger.error("Error clearing Redis cache for key #{cache_key(type, id)}: #{e.message}\n#{e.backtrace.join("\n")}")
        end
      end
    end
  end
end 