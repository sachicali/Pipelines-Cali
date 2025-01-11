require 'dotenv/load'
require_relative 'pipeline/version'
require_relative 'pipeline/configuration'
require_relative 'pipeline/errors'
require_relative 'pipeline/youtube_analytics'
require_relative 'pipeline/youtube_channel_analyzer'
require_relative 'pipeline/youtube_data_visualizer'
require_relative 'pipeline/youtube_recommendations_engine'
require_relative 'pipeline/workers'

module Pipeline
  class << self
    attr_writer :logger

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def logger
      @logger ||= Rails.logger
    end

    def root
      File.expand_path('..', __dir__)
    end
  end
end 