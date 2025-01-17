# Configuration Documentation

## 1. Core Configuration Files

### 1.1 Application Configuration
- `config/application.rb` - Main application configuration
- `config/environments/` - Environment-specific configurations
  - `development.rb` - Development environment
  - `production.rb` - Production environment
  - `test.rb` - Test environment

- `config/boot.rb` - Boot configuration
- `config/environment.rb` - Environment setup

### 1.2 Database Configuration
- `config/database.yml` - Database connection settings
- `config/initializers/active_record.rb` - ActiveRecord settings
- `config/initializers/database_cleaner.rb` - Database cleaner settings

### 1.3 API Configuration
- `config/initializers/api_authentication.rb` - API authentication
- `config/initializers/rate_limiting.rb` - API rate limiting
- `config/initializers/sidekiq.rb` - Sidekiq configuration

### 1.4 Security Configuration
- `config/initializers/devise.rb` - Devise authentication
- `config/initializers/secure_headers.rb` - Security headers
- `config/initializers/content_security_policy.rb` - CSP configuration

## 2. Configuration Patterns

### 2.1 Environment Variables
```ruby
ENV['DATABASE_URL'] || 'sqlite3:db/development.sqlite3'
```

### 2.2 Initializers
- `config/initializers/` - Contains all initializers
- Common initializers:
  - `assets.rb` - Asset pipeline
  - `inflections.rb` - Custom inflections
  - `sidekiq.rb` - Sidekiq setup

### 2.3 Custom Configuration
```ruby
# config/application.rb
config.x.custom_setting = ENV.fetch('CUSTOM_SETTING', 'default')
```

## 3. Memory Context

### 3.1 Configuration Memory Structure
The configuration memory is organized as follows:

- **3.1.1 Configuration Root**
  - Type: Configuration
  - Description: Root node for all configuration-related memory
  - Relations:
    - Connected to: Main Project Memory
    - Connected to: Configuration Type Memories

- **3.1.2 Configuration Type Memories**
  - Type: ConfigurationType
  - Description: Memory nodes for each configuration type
  - Observations:
    - Stores configuration values
    - Tracks configuration changes
    - Maintains configuration dependencies
  - Relations:
    - Connected to: Configuration Root
    - Connected to: Environment Memories

- **3.1.3 Environment Memories**
  - Type: Environment
  - Description: Memory nodes for environment-specific configurations
  - Observations:
    - Stores environment settings
    - Tracks environment-specific overrides
    - Maintains environment relationships
  - Relations:
    - Connected to: Configuration Type Memories
    - Connected to: Initializer Memories

### 3.2 Memory Integration
The configuration system integrates with the project memory through:

1.  **3.2.1 Configuration Tracking**
   - Configuration changes are logged in memory with:
     - Configuration key
     - Old value
     - New value
     - Timestamp

2.  **3.2.2 Environment Management**
   - Environment settings are stored in memory with:
     - Environment name
     - Settings
     - Overrides
     - Dependencies

3.  **3.2.3 Initializer Tracking**
   - Initializer execution is tracked in memory with:
     - Initializer name
     - Execution time
     - Configuration changes
     - Dependencies

4.  **3.2.4 Security Tracking**
   - Security configurations are stored in memory with:
     - Configuration type
     - Settings
     - Last modified
     - Dependencies

### 3.3 Memory Access Patterns
The configuration system accesses memory through:
- Configuration value retrieval
- Environment-specific settings
- Initializer execution tracking
- Security configuration analysis

### 3.4 Example Memory Query
```ruby
# Query configuration memory for database settings
database_memory = Memory.query(
  type: 'ConfigurationType',
  name: 'Database'
)
```

## 4. Database Schema and Seed Data

### 4.1 Database Schema
The database schema is defined in `db/schema.rb`. This file is auto-generated from the current state of the database and should not be edited directly. Instead, use Active Record migrations to incrementally modify the database and then regenerate the schema definition.

### 4.2 Seed Data
The seed data for initial database population is defined in `db/seeds.rb`. This file ensures the existence of records required to run the application in every environment (production, development, test). The code here should be idempotent so that it can be executed at any point in every environment. The data can then be loaded with the `bin/rails db:seed` command (or created alongside the database with `db:setup`).

### 4.3 Example Seed Data
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