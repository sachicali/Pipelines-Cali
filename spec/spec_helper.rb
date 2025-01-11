require 'bundler/setup'
require 'pipeline'
require 'vcr'
require 'webmock/rspec'
require 'pry'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('<YOUTUBE_API_KEY>') { Pipeline.configuration.youtube_api_key }
end

RSpec.configure do |config|
  config.before(:suite) do
    Pipeline.configure do |c|
      c.youtube_api_key = 'test_api_key'
      c.storage_path = 'tmp/test/pipeline'
      c.redis_url = 'redis://localhost:6379/1' # Test DB
    end
  end

  config.after(:suite) do
    FileUtils.rm_rf('tmp/test')
  end
end 