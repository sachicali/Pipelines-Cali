module Pipeline
  class ChannelService
    def initialize(channel_id)
      @channel_id = channel_id
    end
    
    def start_analysis
      validate_channel_id!
      schedule_analysis
      { status: 'processing', channel_id: @channel_id }
    end
    
    def fetch_status
      {
        channel_id: @channel_id,
        analysis: cache_status('analysis'),
        dashboard: cache_status('dashboard'),
        recommendations: cache_status('recommendations')
      }
    end
    
    def fetch_results
      validate_results!
      
      {
        analysis: fetch_from_cache('analysis'),
        dashboard: fetch_from_cache('dashboard'),
        recommendations: fetch_from_cache('recommendations')
      }
    end
    
    private
    
    def validate_channel_id!
      unless YoutubeChannelValidator.valid_channel_id?(@channel_id)
        raise ValidationError, 'Invalid YouTube channel ID format'
      end
    end
    
    def validate_results!
      unless analysis_complete?
        raise ValidationError, 'Analysis results not ready'
      end
    end
    
    def schedule_analysis
      Workers::ChannelAnalysisWorker.perform_async(@channel_id)
    end
    
    def analysis_complete?
      %w[analysis dashboard recommendations].all? do |type|
        cache_status(type) == 'completed'
      end
    end
    
    def cache_status(type)
      fetch_from_cache(type) ? 'completed' : 'pending'
    end
    
    def fetch_from_cache(type)
      Rails.cache.read(cache_key(type))
    end
    
    def cache_key(type)
      "pipeline:#{type}:#{@channel_id}"
    end
  end
end 