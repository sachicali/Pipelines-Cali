require 'sinatra/base'
require 'json'

module Pipeline
  class Web < Sinatra::Base
    set :public_folder, 'public'
    set :views, File.join(File.dirname(__FILE__), 'templates')

    get '/' do
      erb :index
    end

    post '/analyze' do
      channel_id = params[:channel_id]
      worker = Workers::ChannelAnalysisWorker.new
      worker.perform(channel_id)
      
      redirect "/results/#{channel_id}"
    end

    get '/results/:channel_id' do
      @channel_id = params[:channel_id]
      @results = load_results(@channel_id)
      erb :results
    end

    get '/grid' do
      erb :grid_view
    end

    get '/api/videos' do
      content_type :json
      cache_key = "pipeline:videos:#{params[:channel_id]}"
      
      videos = Services::CacheService.new.fetch(cache_key) do
        analyzer = ChannelAnalyzer.new(params[:channel_id], youtube_service)
        analyzer.fetch_channel_videos
      end

      videos.map do |video|
        {
          title: video[:title],
          views: video[:views],
          vph: video[:vph],
          publishedAt: video[:published_at],
          engagement: calculate_engagement(video),
          status: determine_status(video),
          tags: extract_tags(video[:title])
        }
      end.to_json
    end

    private

    def load_results(channel_id)
      path = "#{Pipeline.configuration.storage_path}/reports/#{channel_id}"
      JSON.parse(File.read("#{path}/report.json"), symbolize_names: true)
    rescue Errno::ENOENT
      nil
    end

    def calculate_engagement(video)
      ((video[:likes] + video[:comments]) / video[:views].to_f * 100).round(2)
    end

    def determine_status(video)
      vph = video[:vph]
      avg_vph = video[:avg_vph]
      
      if vph > avg_vph * 1.5
        'trending'
      elsif vph < avg_vph * 0.5
        'declining'
      else
        'stable'
      end
    end

    def extract_tags(title)
      # Simple tag extraction from title
      title.scan(/#\w+/).map { |tag| tag.gsub('#', '') }
    end
  end
end 