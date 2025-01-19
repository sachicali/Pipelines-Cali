# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server

require_relative 'config/boot'
require 'rack'
require 'json'

class WebApp
  def call(env)
    request = Rack::Request.new(env)

    case request.path
    when '/'
      [ 200, { 'Content-Type' => 'text/html' }, [ render_dashboard ] ]
    when '/grid'
      [ 200, { 'Content-Type' => 'text/html' }, [ render_grid ] ]
    when %r{/results/(.+)}
      channel_id = $1
      [ 200, { 'Content-Type' => 'application/json' }, [ get_channel_results(channel_id) ] ]
    else
      [ 404, { 'Content-Type' => 'text/plain' }, [ 'Not Found' ] ]
    end
  end

  private

  def render_dashboard
    File.read('public/index.html')
  end

  def render_grid
    File.read('public/grid.html')
  end

  def get_channel_results(channel_id)
    analytics = Pipeline::YouTubeAnalytics.new(Pipeline.configuration.youtube_api_key)
    analyzer = Pipeline::YouTubeChannelAnalyzer.new(channel_id, analytics.service)
    JSON.pretty_generate(analyzer.analyze)
  end
end

run WebApp.new
