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
- `config/database.yml` - Database settings (SQLite3)
- `db/schema.rb` - Database schema
- `db/seeds.rb` - Seed data for initial database population

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
```

## Memory Context

### Configuration Memory Structure
The configuration memory is organized as follows:

- **Configuration Root**
  - Type: Configuration
  - Description: Root node for all configuration-related memory
  - Relations:
    - Connected to: Main Project Memory
    - Connected to: Configuration Type Memories

- **Configuration Type Memories**
  - Type: ConfigurationType
  - Description: Memory nodes for each configuration type
  - Observations:
    - Stores configuration values
    - Tracks configuration changes
    - Maintains configuration dependencies
  - Relations:
    - Connected to: Configuration Root
    - Connected to: Environment Memories

- **Environment Memories**
  - Type: Environment
  - Description: Memory nodes for environment-specific configurations
  - Observations:
    - Stores environment settings
    - Tracks environment-specific overrides
    - Maintains environment relationships
  - Relations:
    - Connected to: Configuration Type Memories
    - Connected to: Initializer Memories

### Memory Integration
The configuration system integrates with the project memory through:

1. **Configuration Tracking**
   - Configuration changes are logged in memory with:
     - Configuration key
     - Old value
     - New value
     - Timestamp

2. **Environment Management**
   - Environment settings are stored in memory with:
     - Environment name
     - Settings
     - Overrides
     - Dependencies

3. **Initializer Tracking**
   - Initializer execution is tracked in memory with:
     - Initializer name
     - Execution time
     - Configuration changes
     - Dependencies

4. **Security Tracking**
   - Security configurations are stored in memory with:
     - Configuration type
     - Settings
     - Last modified
     - Dependencies

### Memory Access Patterns
The configuration system accesses memory through:
- Configuration value retrieval
- Environment-specific settings
- Initializer execution tracking
- Security configuration analysis

### Example Memory Query
```ruby
# Query configuration memory for database settings
database_memory = Memory.query(
  type: 'ConfigurationType',
  name: 'Database'
)
```

## Database Schema and Seed Data

### Database Schema
The database schema is defined in `db/schema.rb`. This file is auto-generated from the current state of the database and should not be edited directly. Instead, use Active Record migrations to incrementally modify the database and then regenerate the schema definition.

### Seed Data
The seed data for initial database population is defined in `db/seeds.rb`. This file ensures the existence of records required to run the application in every environment (production, development, test). The code here should be idempotent so that it can be executed at any point in every environment. The data can then be loaded with the `bin/rails db:seed` command (or created alongside the database with `db:setup`).

### Example Seed Data
```ruby
# db/seeds.rb
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end