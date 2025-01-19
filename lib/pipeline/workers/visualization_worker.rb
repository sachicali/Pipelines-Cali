module Pipeline
  module Workers
    class VisualizationWorker
      include Sidekiq::Worker
      
      def perform(channel_id)
        log_start('visualization', channel_id)
        begin
          results = load_analysis_results(channel_id)
          visualizer = Pipeline::YouTubeDataVisualizer.new(results)
          
          dashboard = visualizer.generate_dashboard
          store_visualizations(channel_id, dashboard)
        rescue StandardError => e
          log_error('visualization', channel_id, e)
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
      
      def store_visualizations(channel_id, dashboard)
        base_path = "#{Pipeline.configuration.storage_path}/graphs/#{channel_id}"
        begin
          FileUtils.mkdir_p(base_path)
        rescue StandardError => e
          Rails.logger.error("Error creating directory #{base_path}: #{e.message}\n#{e.backtrace.join("\n")}")
          raise Pipeline::StorageError, "Error creating directory #{base_path}: #{e.message}"
        end
        
        dashboard[:performance_graphs].each do |name, graph|
          begin
            graph.write("#{base_path}/#{name}.png")
          rescue StandardError => e
            Rails.logger.error("Error writing graph #{name} to file #{base_path}/#{name}.png: #{e.message}\n#{e.backtrace.join("\n")}")
            raise Pipeline::StorageError, "Error writing graph #{name} to file #{base_path}/#{name}.png: #{e.message}"
          end
        end
      end
    end
  end
end 