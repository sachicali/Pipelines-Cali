require 'spec_helper'

RSpec.describe Pipeline::YouTubeAnalytics do
  let(:analytics) { described_class.new('test_api_key') }
  let(:channel_id) { 'UC_test_channel' }

  describe '#initialize' do
    it 'creates a new instance with API key' do
      expect(analytics.api_key).to eq('test_api_key')
      expect(analytics.service).to be_a(Google::Apis::YoutubeV3::YouTubeService)
    end
  end

  describe '#fetch_channel_data', :vcr do
    it 'fetches channel data successfully' do
      VCR.use_cassette('youtube_channel_data') do
        data = analytics.fetch_channel_data(channel_id)
        expect(data).to include(:title, :subscriber_count, :video_count)
      end
    end

    it 'handles API errors gracefully' do
      allow(analytics.service).to receive(:list_channels).and_raise(Google::Apis::Error)
      expect { analytics.fetch_channel_data('invalid_id') }.to raise_error(Pipeline::Error)
    end
  end
end 