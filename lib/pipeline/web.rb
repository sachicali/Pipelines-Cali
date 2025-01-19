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
      begin
        worker = Workers::ChannelAnalysisWorker.new
        worker.perform(channel_id)
      rescue StandardError => e
        Rails.logger.error("Error analyzing channel #{channel_id}: #{e.message}\n#{e.backtrace.join("\n")}")
        redirect '/'
      end
      
      redirect "/results/#{channel_id}"
    end

    get '/results/:channel_id' do
      @channel_id = params[:channel_id]
      begin
        @results = load_results(@channel_id)
      rescue StandardError => e
        Rails.logger.error("Error loading results for channel #{@channel_id}: #{e.message}\n#{e.backtrace.join("\n")}")
        @results = nil
      end
      erb :results
    end

    get '/grid' do
      erb :grid_view
    end

    get '/api/videos' do
      content_type :json
      cache_key = "pipeline:videos:#{params[:channel_id]}"
      begin
        videos = Services::CacheService.new.fetch(cache_key) do
          analyzer = YouTubeChannelAnalyzer.new(params[:channel_id], YouTubeAnalytics.new.service)
          analyzer.fetch_channel_videos
        end
      rescue StandardError => e
        Rails.logger.error("Error fetching videos for channel #{params[:channel_id]}: #{e.message}\n#{e.backtrace.join("\n")}")
        return { error: "Error fetching videos" }.to_json
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
      begin
        JSON.parse(File.read("#{path}/report.json"), symbolize_names: true)
      rescue Errno::ENOENT => e
        Rails.logger.error("Error loading report from file #{path}/report.json: #{e.message}\n#{e.backtrace.join("\n")}")
        nil
      rescue StandardError => e
        Rails.logger.error("Unexpected error loading report from file #{path}/report.json: #{e.message}\n#{e.backtrace.join("\n")}")
        nil
      end
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