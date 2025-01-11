require 'spec_helper'

RSpec.describe Pipeline::Services::MetricsService do
  let(:service) { described_class.new }
  let(:sample_metrics) do
    {
      performance_metrics: {
        video_views: {
          '2024-01-01' => 1000,
          '2024-01-02' => 1500,
          '2024-01-03' => 2000
        },
        engagement_rates: {
          likes: [0.1, 0.2, 0.3],
          comments: [0.05, 0.07, 0.09]
        },
        historical_data: {
          views: [1000, 1500, 2000],
          engagement: [0.1, 0.15, 0.2]
        }
      }
    }
  end

  describe '#track_analysis' do
    it 'tracks and caches analysis data' do
      result = service.track_analysis('test_channel', sample_metrics)
      expect(result).to include(:channel_id, :timestamp, :metrics, :trends)
    end
  end

  describe '#calculate_trends' do
    let(:trends) { service.send(:calculate_trends, sample_metrics) }

    it 'calculates view trends correctly' do
      expect(trends[:views_trend]).to include(:trend_line, :growth_rate)
    end

    it 'calculates engagement trends correctly' do
      expect(trends[:engagement_trend]).to include(:likes_trend, :comments_trend)
    end

    it 'calculates growth rate correctly' do
      expect(trends[:growth_rate]).to include(:short_term, :medium_term, :long_term)
    end
  end
end 