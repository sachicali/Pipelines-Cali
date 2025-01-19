module Pipeline
  class Report
    attr_reader :path

    def initialize(channel_id)
      @channel_id = channel_id
      @cache = Services::CacheService.new
      @metrics = Services::MetricsService.new
      @path = "#{Pipeline.configuration.storage_path}/reports/#{channel_id}"
    end

    def generate
      begin
        FileUtils.mkdir_p(@path)
      rescue StandardError => e
        Rails.logger.error("Error creating directory #{@path}: #{e.message}\n#{e.backtrace.join("\n")}")
        raise Pipeline::StorageError, "Error creating directory #{@path}: #{e.message}"
      end
      
      collect_data
      generate_insights
      create_visualizations
      compile_report
    rescue StandardError => e
      Rails.logger.error("Error generating report for channel #{@channel_id}: #{e.message}\n#{e.backtrace.join("\n")}")
      raise
    end

    private

    def collect_data
      @analysis = load_analysis_results
      @recommendations = load_recommendations
      @metrics_data = @metrics.track_analysis(@channel_id, @analysis)
    end

    def generate_insights
      @insights = {
        performance_summary: generate_performance_summary,
        content_insights: generate_content_insights,
        growth_opportunities: identify_growth_opportunities,
        action_items: create_action_items
      }
    end

    def create_visualizations
      charts = {
        performance: create_performance_charts,
        trends: create_trend_charts,
        comparisons: create_comparison_charts
      }

      store_charts(charts)
    end

    def compile_report
      begin
        template = ERB.new(File.read(report_template_path))
        report_content = template.result(binding)
      rescue StandardError => e
        Rails.logger.error("Error reading report template: #{e.message}\n#{e.backtrace.join("\n")}")
        raise Pipeline::StorageError, "Error reading report template: #{e.message}"
      end

      begin
        File.write(File.join(@path, 'report.html'), report_content)
      rescue StandardError => e
        Rails.logger.error("Error writing report.html to file: #{e.message}\n#{e.backtrace.join("\n")}")
        raise Pipeline::StorageError, "Error writing report.html to file: #{e.message}"
      end
      begin
        File.write(File.join(@path, 'report.json'), JSON.pretty_generate(compile_json_report))
      rescue StandardError => e
        Rails.logger.error("Error writing report.json to file: #{e.message}\n#{e.backtrace.join("\n")}")
        raise Pipeline::StorageError, "Error writing report.json to file: #{e.message}"
      end
    end

    def compile_json_report
      {
        channel_id: @channel_id,
        generated_at: Time.now.utc,
        analysis: @analysis,
        insights: @insights,
        recommendations: @recommendations,
        metrics: @metrics_data
      }
    end

    def report_template_path
      File.join(File.dirname(__FILE__), 'templates', 'report.html.erb')
    end
  end
end 