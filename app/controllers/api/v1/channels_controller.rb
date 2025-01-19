module Api
  module V1
    class ChannelsController < BaseController
      # @description Starts the analysis of a YouTube channel.
      # @param channel_id [String] The ID of the YouTube channel to analyze.
      # @response [JSON]
      #   {
      #     message: 'Analysis started',
      #     channel_id: 'UC_test_channel',
      #     status: 'processing'
      #   }
      def analyze
        channel_id = params.require(:channel_id)
        begin
          Pipeline::Workers::ChannelAnalysisWorker.perform_async(channel_id)
        rescue StandardError => e
          Rails.logger.error("Error enqueuing channel analysis for channel #{channel_id}: #{e.message}\n#{e.backtrace.join("\n")}")
          render json: { error: "Error enqueuing channel analysis" }, status: :internal_server_error
        end
        
        render json: {
          message: 'Analysis started',
          channel_id: channel_id,
          status: 'processing'
        }, status: :accepted
      end
      
      # @description Gets the status of a channel analysis.
      # @param channel_id [String] The ID of the YouTube channel.
      # @response [JSON]
      #   {
      #     channel_id: 'UC_test_channel',
      #     analysis: 'pending',
      #     dashboard: 'pending',
      #     recommendations: 'pending'
      #   }
      def status
        channel_id = params.require(:channel_id)
        
        status = fetch_analysis_status(channel_id)
        
        render json: status
      end
      
      # @description Gets the analysis results for a channel.
      # @param channel_id [String] The ID of the YouTube channel.
      # @response [JSON]
      #   {
      #     analysis: { ... },
      #     dashboard: { ... },
      #     recommendations: { ... }
      #   }
      def results
        channel_id = params.require(:channel_id)
        
        results = {
          analysis: fetch_from_cache('analysis', channel_id),
          dashboard: fetch_from_cache('dashboard', channel_id),
          recommendations: fetch_from_cache('recommendations', channel_id)
        }
        
        render json: results
      end
      
      # @description Gets the dashboard data for a channel.
      # @param channel_id [String] The ID of the YouTube channel.
      # @response [JSON]
      #   {
      #     metrics: { ... },
      #     chartData: { ... }
      #   }
      def dashboard
        channel_id = params.require(:channel_id)
        
        dashboard_data = {
          metrics: fetch_from_cache('dashboard', channel_id),
        }
        
        render json: dashboard_data
      end
      
      private
      def fetch_from_cache(type, id)
        begin
          Rails.cache.read("pipeline:#{type}:#{id}")
        rescue StandardError => e
          Rails.logger.error("Error fetching from cache for type #{type} and channel #{id}: #{e.message}\n#{e.backtrace.join("\n")}")
          nil
        end
      end
      
      def fetch_analysis_status(channel_id)
        {
          channel_id: channel_id,
          analysis: cache_status('analysis', channel_id),
          dashboard: cache_status('dashboard', channel_id),
          recommendations: cache_status('recommendations', channel_id)
        }
      end
      
      def cache_status(type, id)
        fetch_from_cache(type, id) ? 'completed' : 'pending'
      end
      
      # @description Gets the competitor data for a channel.
      # @param channel_id [String] The ID of the YouTube channel.
      # @response [JSON]
      #   {
      #     competitors: [
      #       {
      #         name: 'Tech Innovators',
      #         subscribers: 1500000,
      #         outlierVideos: [
      #           { title: 'AI Revolution', views: 2300000 },
      #           { title: 'Quantum Computing', views: 1800000 }
      #         ]
      #       },
      #       {
      #         name: 'Code Masters',
      #         subscribers: 850000,
      #         outlierVideos: [
      #           { title: 'React Advanced Patterns', views: 1100000 },
      #           { title: 'Node.js Performance', views: 950000 }
      #         ]
      #       }
      #     ]
      #   }
      def competitors
        channel_id = params.require(:channel_id)
        
        competitor_data = {
          competitors: fetch_from_cache('competitors', channel_id)
        }
        
        render json: competitor_data
      end
      
      # @description Imports a YouTube channel.
      # @param channel_id [String] The ID of the YouTube channel to import.
      # @response [JSON]
      #   {
      #     message: 'Channel import started',
      #     channel_id: 'UC_test_channel',
      #     status: 'processing'
      #   }
      def import
        channel_id = params.require(:channel_id)
        begin
          Pipeline::Workers::ChannelAnalysisWorker.perform_async(channel_id)
        rescue StandardError => e
          Rails.logger.error("Error enqueuing channel analysis for channel #{channel_id}: #{e.message}\n#{e.backtrace.join("\n")}")
          render json: { error: "Error enqueuing channel import" }, status: :internal_server_error
        end
        
        render json: {
          message: 'Channel import started',
          channel_id: channel_id,
          status: 'processing'
        }, status: :accepted
      end
    
      # @description Gets the notifications for a channel.
      # @param channel_id [String] The ID of the YouTube channel.
      # @response [JSON]
      #   {
      #     notifications: [
      #       { title: 'New Subscriber', description: 'You gained a new subscriber: JohnDoe123' },
      #       { title: 'Video Performance', description: 'Your video "React Tutorial" is trending' },
      #       { title: 'Comment Mention', description: 'You were mentioned in a comment' }
      #     ]
      #   }
      def notifications
        channel_id = params.require(:channel_id)
        
        notification_data = {
          notifications: fetch_from_cache('notifications', channel_id)
        }
        
        render json: notification_data
      end
    end
  end
end