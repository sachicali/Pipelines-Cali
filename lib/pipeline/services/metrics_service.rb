module Pipeline
  module Services
    class MetricsService
      def initialize
        @cache = CacheService.new
      end
      
      def track_analysis(channel_id, metrics)
        key = "metrics:analysis:#{channel_id}"
        current_time = Time.now.utc
        begin
          @cache.fetch(key, expires_in: 30.days) do
            {
              channel_id: channel_id,
              timestamp: current_time,
              metrics: metrics,
              trends: calculate_trends(metrics)
            }
          end
        rescue StandardError => e
          Rails.logger.error("Error tracking analysis for channel #{channel_id}: #{e.message}\n#{e.backtrace.join("\n")}")
          nil
        end
      end
      
      private
      
      def calculate_trends(metrics)
        {
          views_trend: calculate_view_trend(metrics),
          engagement_trend: calculate_engagement_trend(metrics),
          growth_rate: calculate_growth_rate(metrics),
          performance_indicators: calculate_performance_indicators(metrics)
        }
      end
      
      def calculate_view_trend(metrics)
        views_data = metrics[:performance_metrics][:video_views]
        dates = views_data.keys.sort
        
        {
          trend_line: calculate_trend_line(dates, views_data.values),
          growth_rate: calculate_percentage_change(views_data.values),
          velocity: calculate_velocity(dates, views_data.values),
          prediction: predict_future_views(dates, views_data.values)
        }
      end
      
      def calculate_engagement_trend(metrics)
        engagement_data = metrics[:performance_metrics][:engagement_rates]
        
        {
          likes_trend: calculate_metric_trend(engagement_data[:likes]),
          comments_trend: calculate_metric_trend(engagement_data[:comments]),
          overall_engagement: calculate_overall_engagement(engagement_data),
          benchmarks: calculate_engagement_benchmarks(engagement_data)
        }
      end
      
      def calculate_growth_rate(metrics)
        historical_data = metrics[:performance_metrics][:historical_data]
        periods = analyze_growth_periods(historical_data)
        
        {
          short_term: calculate_period_growth(periods[:short_term]),
          medium_term: calculate_period_growth(periods[:medium_term]),
          long_term: calculate_period_growth(periods[:long_term]),
          projected_growth: project_future_growth(periods)
        }
      end

      def calculate_performance_indicators(metrics)
        {
          viewer_retention: calculate_retention_trend(metrics),
          audience_engagement: calculate_audience_engagement(metrics),
          content_performance: analyze_content_performance(metrics),
          optimization_score: calculate_optimization_score(metrics)
        }
      end

      # Helper methods for trend calculations
      def calculate_trend_line(dates, values)
        x = dates.map(&:to_i)
        y = values
        
        # Simple linear regression
        n = x.length
        sum_x = x.sum
        sum_y = y.sum
        sum_xy = x.zip(y).map { |xi, yi| xi * yi }.sum
        sum_xx = x.map { |xi| xi * xi }.sum
        
        slope = (n * sum_xy - sum_x * sum_y) / (n * sum_xx - sum_x * sum_x)
        intercept = (sum_y - slope * sum_x) / n
        
        {
          slope: slope,
          intercept: intercept,
          r_squared: calculate_r_squared(x, y, slope, intercept)
        }
      end

      def calculate_r_squared(x, y, slope, intercept)
        y_mean = y.sum / y.length.to_f
        ss_tot = y.map { |yi| (yi - y_mean) ** 2 }.sum
        ss_res = y.zip(x).map { |yi, xi| (yi - (slope * xi + intercept)) ** 2 }.sum
        
        1 - (ss_res / ss_tot)
      end

      def predict_future_views(dates, values)
        trend = calculate_trend_line(dates, values)
        future_dates = generate_future_dates(dates.last, 30)
        
        future_dates.map do |date|
          {
            date: date,
            predicted_views: (trend[:slope] * date.to_i + trend[:intercept]).round
          }
        end
      end
    end
  end
end 