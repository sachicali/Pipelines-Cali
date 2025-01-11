require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile
Bundler.require(*Rails.groups)

module Pipeline
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Custom configurations
    config.autoload_lib(ignore: %w[assets tasks])
    config.time_zone = "UTC"
    config.eager_load_paths << Rails.root.join("lib")
    
    # API configurations
    config.api_only = false
    
    # Active Job configuration
    config.active_job.queue_adapter = :sidekiq

    # Logger configuration
    config.logger = ActiveSupport::Logger.new(STDOUT)
    config.log_level = ENV.fetch('RAILS_LOG_LEVEL', 'info')

    # Basic cache configuration
    config.cache_store = :memory_store
  end
end
