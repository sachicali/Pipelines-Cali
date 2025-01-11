module Pipeline
  module Workers
    class NotificationWorker < BaseWorker
      sidekiq_options queue: :notifications, 
                      retry: 3,
                      dead: false,
                      backtrace: true

      def perform(channel_id, event_type, data_key = nil)
        log_start('notification', channel_id)
        
        notification = build_notification(channel_id, event_type, data_key)
        deliver_notification(notification)
      rescue => e
        log_error('notification', channel_id, e)
        raise
      end

      private

      def build_notification(channel_id, event_type, data_key)
        {
          channel_id: channel_id,
          event_type: event_type,
          data_key: data_key,
          timestamp: Time.current,
          message: notification_message(event_type),
          data: fetch_notification_data(data_key)
        }
      end

      def notification_message(event_type)
        case event_type
        when 'visualization_complete'
          'Your channel visualizations are ready!'
        when 'recommendations_complete'
          'Your channel recommendations are ready!'
        when 'analysis_complete'
          'Your channel analysis is complete!'
        else
          'Process completed successfully!'
        end
      end

      def deliver_notification(notification)
        # Broadcast via ActionCable
        ActionCable.server.broadcast(
          "pipeline_channel_#{notification[:channel_id]}",
          notification
        )
        
        # Store notification in cache for history
        store_notification(notification)
      end

      def store_notification(notification)
        notifications = fetch_notifications(notification[:channel_id])
        notifications.push(notification)
        
        Rails.cache.write(
          notifications_cache_key(notification[:channel_id]),
          notifications.last(100), # Keep last 100 notifications
          expires_in: 7.days
        )
      end

      def fetch_notifications(channel_id)
        Rails.cache.read(notifications_cache_key(channel_id)) || []
      end

      def notifications_cache_key(channel_id)
        "pipeline:notifications:#{channel_id}"
      end

      def fetch_notification_data(data_key)
        return nil unless data_key
        Rails.cache.read(data_key)
      end
    end
  end
end 