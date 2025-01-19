require 'active_support/concern'

class TestConcernModel
  include ActiveSupport::Concern
  include Cacheable
  include Loggable
  include ApiAccessible
  include MetricsHandling
  include ChannelAnalysis
  include VisualizationHandling

  def initialize
    self.class.api_base_url = 'https://api.example.com'
  end

  def test_metrics_handling
    fetch_metrics(:test_metric, 'test_id')
  end

  def test_channel_analysis
    analyze_channel('test_channel_id')
  end

  def test_visualization
    generate_visualization({ test: 'data' }, :time_series)
  end

  def self.cache_ttl
    ::Pipeline.configuration.cache_ttl
  end
end