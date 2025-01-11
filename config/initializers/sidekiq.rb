require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { url: Pipeline.configuration.redis_url }
  
  config.logger.level = Rails.logger.level
  
  config.on(:startup) do
    schedule_file = Rails.root.join('config', 'schedule.yml')
    Sidekiq::Cron::Job.load_from_hash(YAML.load_file(schedule_file)) if File.exist?(schedule_file)
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: Pipeline.configuration.redis_url }
end 