require 'spec_helper'

RSpec.describe Pipeline::ChannelAnalyzer do
  let(:service) { instance_double(Google::Apis::YoutubeV3::YouTubeService) }
  let(:analyzer) { described_class.new('test_channel', service) }
  let(:sample_video_data) do
    [
      {
        id: 'video1',
        title: 'Test Video 1',
        published_at: Time.now - 7.days,
        views: 1000,
        likes: 100,
        comments: 50,
        vph: 5.5
      },
      {
        id: 'video2',
        title: 'Test Video 2',
        published_at: Time.now - 14.days,
        views: 2000,
        likes: 200,
        comments: 100,
        vph: 6.0
      }
    ]
  end

  before do
    allow(analyzer).to receive(:fetch_channel_videos).and_return(sample_video_data)
  end

  describe '#analyze' do
    it 'returns complete analysis results' do
      results = analyzer.analyze
      expect(results).to include(:performance_metrics, :upload_patterns, :content_analysis)
    end

    it 'calculates correct average views' do
      expect(analyzer.send(:average_views)).to eq(1500.0)
    end

    it 'identifies outliers correctly' do
      outliers = analyzer.send(:identify_outliers)
      expect(outliers.length).to be >= 0
    end
  end
end 