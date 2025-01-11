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
        
        cached = @redis.get(key)
        return JSON.parse(cached, symbolize_names: true) if cached
        
        result = yield
        @redis.setex(key, expires_in, result.to_json)
        result
      end
      
      def clear(type, id)
        @redis.del(cache_key(type, id))
      end
    end
  end
end 