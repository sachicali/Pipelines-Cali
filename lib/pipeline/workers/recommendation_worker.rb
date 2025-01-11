module Pipeline
  module Workers
    class RecommendationWorker
      include Sidekiq::Worker
      
      def perform(channel_id)
        results = load_analysis_results(channel_id)
        engine = Pipeline::RecommendationsEngine.new(results)
        
        recommendations = engine.generate_recommendations
        store_recommendations(channel_id, recommendations)
      end
      
      private
      
      def load_analysis_results(channel_id)
        file_path = "#{Pipeline.configuration.storage_path}/reports/#{channel_id}_analysis.json"
        JSON.parse(File.read(file_path), symbolize_names: true)
      end
      
      def store_recommendations(channel_id, recommendations)
        File.write(
          "#{Pipeline.configuration.storage_path}/reports/#{channel_id}_recommendations.json",
          JSON.pretty_generate(recommendations)
        )
      end
    end
  end
end 