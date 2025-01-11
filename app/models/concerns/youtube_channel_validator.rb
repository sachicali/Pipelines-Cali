module YoutubeChannelValidator
  extend ActiveSupport::Concern
  
  CHANNEL_ID_FORMAT = /\AUC[\w-]{22}\z/
  
  included do
    validates :channel_id, presence: true, format: { with: CHANNEL_ID_FORMAT }
  end
  
  class_methods do
    def valid_channel_id?(channel_id)
      channel_id.match?(CHANNEL_ID_FORMAT)
    end
  end
end 