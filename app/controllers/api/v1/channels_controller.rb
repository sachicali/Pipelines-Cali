module Api
  module V1
    class ChannelsController < BaseController
      def analyze
        channel_id = params.require(:channel_id)
        
        Pipeline::Workers::ChannelAnalysisWorker.perform_async(channel_id)
        
        render json: {
          message: 'Analysis started',
          channel_id: channel_id,
          status: 'processing'
        }, status: :accepted
      end
      
      def status
        channel_id = params.require(:channel_id)
        
        status = fetch_analysis_status(channel_id)
        
        render json: status
      end
      
      def results
        channel_id = params.require(:channel_id)
        
        results = {
          analysis: fetch_from_cache('analysis', channel_id),
          dashboard: fetch_from_cache('dashboard', channel_id),
          recommendations: fetch_from_cache('recommendations', channel_id)
        }
        
        render json: results
      end
      
      private
      
      def fetch_from_cache(type, id)
        Rails.cache.read("pipeline:#{type}:#{id}")
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
    end
  end
end 