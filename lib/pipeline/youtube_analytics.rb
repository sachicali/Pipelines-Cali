require 'google/apis/youtube_v3'

module Pipeline
  class YouTubeAnalytics
    attr_reader :service

    def initialize(api_key = nil)
      @api_key = api_key || Pipeline.configuration.youtube_api_key
      setup_service
    end

    def fetch_channel_data(channel_id)
      validate_channel_id!(channel_id)
      
      begin
        response = service.list_channels(
          'snippet,statistics,contentDetails',
          id: channel_id
        )
        
        channel = response.items.first
        raise APIError, "Channel not found: #{channel_id}" unless channel

        format_channel_data(channel)
      rescue Google::Apis::Error => e
        raise APIError, "YouTube API error: #{e.message}"
      end
    end

    private

    def setup_service
      @service = Google::Apis::YoutubeV3::YouTubeService.new
      @service.key = @api_key
    end

    def validate_channel_id!(channel_id)
      raise ValidationError, "Invalid channel ID" unless channel_id =~ /^UC[\w-]{22}$/
    end

    def format_channel_data(channel)
      {
        id: channel.id,
        title: channel.snippet.title,
        description: channel.snippet.description,
        published_at: channel.snippet.published_at,
        subscriber_count: channel.statistics.subscriber_count,
        video_count: channel.statistics.video_count,
        view_count: channel.statistics.view_count,
        playlist_id: channel.content_details.related_playlists.uploads
      }
    end
  end
end 