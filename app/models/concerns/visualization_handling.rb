module VisualizationHandling
  extend ActiveSupport::Concern

  included do
    # Add class-level visualization configuration
    class_attribute :visualization_cache_ttl
    self.visualization_cache_ttl = 30.minutes
  end

  def generate_visualization(data, type = :default)
    # Generate visualization data based on type
    case type
    when :time_series
      generate_time_series_visualization(data)
    when :comparison
      generate_comparison_visualization(data)
    else
      generate_default_visualization(data)
    end
  end

  def cache_visualization(key, visualization_data)
    store_in_cache(:visualization, key, visualization_data)
  end

  def fetch_cached_visualization(key)
    fetch_from_cache(:visualization, key)
  end

  private

  def generate_default_visualization(data)
    {
      type: :default,
      data: data,
      metadata: {
        generated_at: Time.current,
        version: 1
      }
    }
  end

  def generate_time_series_visualization(data)
    {
      type: :time_series,
      data: data,
      metadata: {
        generated_at: Time.current,
        version: 1,
        x_axis: 'Time',
        y_axis: 'Value'
      }
    }
  end

  def generate_comparison_visualization(data)
    {
      type: :comparison,
      data: data,
      metadata: {
        generated_at: Time.current,
        version: 1,
        comparison_type: 'relative'
      }
    }
  end
end