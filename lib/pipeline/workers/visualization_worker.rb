module Pipeline
  module Workers
    class VisualizationWorker
      include Sidekiq::Worker
      
      def perform(channel_id)
        results = load_analysis_results(channel_id)
        visualizer = Pipeline::DataVisualizer.new(results)
        
        dashboard = visualizer.generate_dashboard
        store_visualizations(channel_id, dashboard)
      end
      
      private
      
      def load_analysis_results(channel_id)
        file_path = "#{Pipeline.configuration.storage_path}/reports/#{channel_id}_analysis.json"
        JSON.parse(File.read(file_path), symbolize_names: true)
      end
      
      def store_visualizations(channel_id, dashboard)
        base_path = "#{Pipeline.configuration.storage_path}/graphs/#{channel_id}"
        FileUtils.mkdir_p(base_path)
        
        dashboard[:performance_graphs].each do |name, graph|
          graph.write("#{base_path}/#{name}.png")
        end
      end
    end
  end
end 