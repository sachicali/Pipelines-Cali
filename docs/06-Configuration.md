# Configuration Documentation

## 1. Architecture Overview

### 1.1 Configuration Structure
```mermaid
reference: config-structure
```

### 1.2 Initialization Flow
```mermaid
reference: config-initialization
```

## 2. Core Configuration

### 2.1 Application Configuration
```ruby
# config/application.rb
module Pipeline
  class Application < Rails::Application
    # Default configuration
    config.load_defaults 7.0

    # Custom configuration
    config.x.youtube.api_key = ENV.fetch('YOUTUBE_API_KEY', nil)
    config.x.cache.ttl = ENV.fetch('CACHE_TTL', 1.hour)
    
    # Time zone and locale
    config.time_zone = 'UTC'
    config.i18n.default_locale = :en
    
    # Autoload paths
    config.autoload_paths += %W[
      #{config.root}/lib
      #{config.root}/app/services
    ]
  end
end
```

### 2.2 Environment Configuration
```ruby
# config/environments/production.rb
Rails.application.configure do
  # Security
  config.force_ssl = true
  config.ssl_options = { hsts: { subdomains: true } }

  # Performance
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false

  # Assets
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.compile = false
end
```

## 3. Initializers

### 3.1 Database Configuration
```yaml
# config/database.yml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

production:
  <<: *default
  url: <%= ENV['DATABASE_URL'] %>
  database: pipeline_production
```

### 3.2 API Configuration
```ruby
# config/initializers/api_authentication.rb
Rails.application.config.middleware.use(
  ApiAuthentication,
  token_header: 'Authorization',
  token_prefix: 'Bearer'
)

# config/initializers/rate_limiting.rb
Rack::Attack.throttle('api/ip', limit: 100, period: 1.minute) do |req|
  req.ip if req.path.start_with?('/api/')
end
```

## 4. Security Configuration

### 4.1 Content Security Policy
```ruby
# config/initializers/content_security_policy.rb
Rails.application.config.content_security_policy do |policy|
  policy.default_src :self
  policy.font_src    :self, :https, :data
  policy.img_src     :self, :https, :data
  policy.script_src  :self, :https
  policy.style_src   :self, :https
end
```

### 4.2 Secure Headers
```ruby
# config/initializers/secure_headers.rb
SecureHeaders::Configuration.default do |config|
  config.x_frame_options = "DENY"
  config.x_content_type_options = "nosniff"
  config.x_xss_protection = "1; mode=block"
  config.x_download_options = "noopen"
  config.x_permitted_cross_domain_policies = "none"
  config.referrer_policy = %w(origin-when-cross-origin strict-origin-when-cross-origin)
end
```

## 5. Error Handling

### 5.1 Development Errors
```ruby
# config/environments/development.rb
config.consider_all_requests_local = true
config.action_dispatch.show_exceptions = true
```

### 5.2 Production Errors
```ruby
# config/environments/production.rb
config.consider_all_requests_local = false
config.action_dispatch.show_exceptions = false

config.exceptions_app = ->(env) {
  ErrorsController.action(:show).call(env)
}
```

## 6. Custom Configuration

### 6.1 Configuration Object
```ruby
# lib/pipeline/configuration.rb
module Pipeline
  class Configuration
    include ActiveSupport::Configurable
    
    config_accessor :youtube_api_key
    config_accessor :cache_ttl
    config_accessor :max_retries
  end
end
```

### 6.2 Usage
```ruby
# config/initializers/pipeline.rb
Pipeline.configure do |config|
  config.youtube_api_key = ENV['YOUTUBE_API_KEY']
  config.cache_ttl = 1.hour
  config.max_retries = 3
end
```

## 7. Testing

### 7.1 Configuration Specs
```ruby
RSpec.describe Pipeline::Configuration do
  it "allows setting youtube_api_key" do
    Pipeline.configure do |config|
      config.youtube_api_key = "test_key"
    end
    
    expect(Pipeline.config.youtube_api_key).to eq("test_key")
  end
end
```

### 7.2 Environment Testing
```ruby
RSpec.configure do |config|
  config.before(:each) do
    allow(Rails).to receive(:env)
      .and_return(ActiveSupport::StringInquirer.new("test"))
  end
end
```

## 8. Deployment

### 8.1 Environment Variables
```bash
# .env.example
RAILS_ENV=production
DATABASE_URL=postgres://user:pass@localhost/dbname
REDIS_URL=redis://localhost:6379/1
YOUTUBE_API_KEY=your_api_key_here
```

### 8.2 Initialization Order
1. Load `.env` file
2. Execute `config/boot.rb`
3. Load environment configuration
4. Run initializers
5. Setup middleware
6. Load application code

## Notes
- Use ENV variables for sensitive data
- Keep initializers focused and minimal
- Monitor configuration changes
- Test configuration in isolation