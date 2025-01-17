# Configuration Documentation

## Core Configuration Files

### Application Configuration
- `config/application.rb` - Main application configuration
- `config/boot.rb` - Boot configuration
- `config/environment.rb` - Environment setup

### Environment-Specific Configuration
- `config/environments/development.rb` - Development settings
- `config/environments/production.rb` - Production settings
- `config/environments/test.rb` - Test settings

### Database Configuration
- `config/database.yml` - Database settings
- `db/schema.rb` - Database schema

### Security Configuration
- `config/credentials.yml.enc` - Encrypted credentials
- `config/content_security_policy.rb` - CSP settings
- `config/filter_parameter_logging.rb` - Parameter filtering

## Configuration Patterns

### Environment Variables
```ruby
ENV['DATABASE_URL'] || 'sqlite3:db/development.sqlite3'
```

### Initializers
- `config/initializers/` - Contains all initializers
- Common initializers:
  - `assets.rb` - Asset pipeline
  - `inflections.rb` - Custom inflections
  - `sidekiq.rb` - Sidekiq setup

### Custom Configuration
```ruby
# config/application.rb
config.x.custom_setting = ENV.fetch('CUSTOM_SETTING', 'default')