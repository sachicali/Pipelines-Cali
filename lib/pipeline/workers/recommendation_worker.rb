module Pipeline
  module Workers
    class RecommendationWorker < BaseWorker
      include Sidekiq::Worker
      include Loggable
      
      def perform(channel_id)
        log_start('recommendations', channel_id)
        begin
          results = load_analysis_results(channel_id)
          engine = Pipeline::RecommendationsEngine.new(results)
          
          recommendations = engine.generate_recommendations
          store_recommendations(channel_id, recommendations)
        rescue StandardError => e
          Rails.logger.error("Error generating recommendations for channel #{channel_id}: #{e.message}\n#{e.backtrace.join("\n")}")
          raise
        end
      end
      
      private
      
      def load_analysis_results(channel_id)
        file_path = "#{Pipeline.configuration.storage_path}/reports/#{channel_id}_analysis.json"
        begin
          JSON.parse(File.read(file_path), symbolize_names: true)
        rescue StandardError => e
          Rails.logger.error("Error loading analysis results from file #{file_path}: #{e.message}\n#{e.backtrace.join("\n")}")
          raise Pipeline::StorageError, "Error loading analysis results from file #{file_path}: #{e.message}"
        end
      end
      
      def store_recommendations(channel_id, recommendations)
        file_path = "#{Pipeline.configuration.storage_path}/reports/#{channel_id}_recommendations.json"
        begin
          File.write(
            file_path,
            JSON.pretty_generate(recommendations)
          )
        rescue StandardError => e
          Rails.logger.error("Error storing recommendations to file #{file_path}: #{e.message}\n#{e.backtrace.join("\n")}")
          raise Pipeline::StorageError, "Error storing recommendations to file #{file_path}: #{e.message}"
        end
      end
    end
  end
end 