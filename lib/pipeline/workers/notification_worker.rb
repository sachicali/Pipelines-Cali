module Pipeline
  module Workers
    class NotificationWorker < BaseWorker
      include Loggable
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
        begin
          Rails.cache.write(
            notifications_cache_key(notification[:channel_id]),
            notifications.last(100), # Keep last 100 notifications
            expires_in: 7.days
          )
        rescue StandardError => e
          Rails.logger.error("Error storing notification in cache for channel #{notification[:channel_id]}: #{e.message}\n#{e.backtrace.join("\n")}")
          raise Pipeline::StorageError, "Error storing notification in cache for channel #{notification[:channel_id]}: #{e.message}"
        end
      end

      def fetch_notifications(channel_id)
        begin
          Rails.cache.read(notifications_cache_key(channel_id)) || []
        rescue StandardError => e
          Rails.logger.error("Error fetching notifications from cache for channel #{channel_id}: #{e.message}\n#{e.backtrace.join("\n")}")
          []
        end
      end

      def notifications_cache_key(channel_id)
        "pipeline:notifications:#{channel_id}"
      end

      def fetch_notification_data(data_key)
        return nil unless data_key
        begin
          Rails.cache.read(data_key)
        rescue StandardError => e
          Rails.logger.error("Error fetching notification data from cache for key #{data_key}: #{e.message}\n#{e.backtrace.join("\n")}")
          nil
        end
      end
    end
  end
end 