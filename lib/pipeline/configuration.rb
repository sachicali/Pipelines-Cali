module Pipeline
  class Configuration
    attr_accessor :youtube_api_key, :storage_path, :redis_url, 
                 :cache_ttl, :max_retries, :logger

    def initialize
      @youtube_api_key = ENV['YOUTUBE_API_KEY']
      @storage_path = ENV.fetch('STORAGE_PATH', 'storage/pipeline')
      @redis_url = ENV.fetch('REDIS_URL', 'redis://localhost:6379/0')
      @cache_ttl = ENV.fetch('CACHE_TTL', 3600).to_i
      @max_retries = ENV.fetch('MAX_RETRIES', 3).to_i
      @logger = Rails.logger
    end

    def validate!
      raise ConfigurationError, 'YouTube API key is required' if youtube_api_key.nil?
      raise ConfigurationError, 'Storage path is required' if storage_path.nil?
      raise ConfigurationError, 'Redis URL is required' if redis_url.nil?
    end
  end
end 