source "https://rubygems.org"

ruby "3.4.1"

# Core gems
gem "rails", "~> 8.0.1"
gem "pg", "~> 1.5.9", :platform => :mingw
gem "puma", ">= 5.0"
gem "sqlite3", ">= 2.1"

# Frontend
gem "propshaft"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "tailwindcss-rails"
gem "chartkick"

# API and Services
gem "google-api-client"
gem "httparty"
gem "redis", ">= 4.0.1"
gem "sidekiq"
gem "sidekiq-batch"
gem "nokogiri"
gem "jbuilder"

# Authentication & Authorization
gem "devise"
gem "pundit"

# Deployment & Infrastructure
gem "kamal", require: false
gem "thruster", require: false
# gem "solid_cache"  # Temporarily disabled
# gem "solid_queue"  # Temporarily disabled
# gem "solid_cable"  # Temporarily disabled
gem "bootsnap", require: false
gem 'gruff'

# Utilities
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "dotenv-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-rails"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "bundler-audit"
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler"
  gem "ruby-lsp", require: false
  gem "ruby-lsp-rails", require: false
  gem "ruby-lsp-rspec", require: false
  gem "syntax_tree", require: false
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webmock"
  gem "vcr"
  gem "simplecov"
end 