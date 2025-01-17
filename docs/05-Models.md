# Models Documentation

## Core Models

### ApplicationRecord
- `app/models/application_record.rb` - Base model class

### Concerns
- `app/models/concerns/youtube_channel_validator.rb` - YouTube channel validation

## Model Responsibilities

### Data Validation
- Validate channel data
- Ensure data integrity
- Enforce business rules

### Relationships
- Define model associations
- Manage data relationships
- Handle cascading operations

### Callbacks
- Before/after actions
- Data transformation
- State management

## Validation Patterns

### YouTube Channel Validation
```ruby
class Channel < ApplicationRecord
  include YoutubeChannelValidator

  validates :channel_id, presence: true
  validate :valid_youtube_channel
end
```

### Custom Validations
```ruby
class Metric < ApplicationRecord
  validate :positive_values

  private

  def positive_values
    errors.add(:base, 'Values must be positive') if value <= 0
  end
end
```

## Query Interface
- Active Record queries
- Scopes
- Custom finders

## Memory Context

### Model Memory Structure
The model memory is organized as follows:

- **Model Root**
  - Type: Model
  - Description: Root node for all model-related memory
  - Relations:
    - Connected to: Main Project Memory
    - Connected to: Model Type Memories

- **Model Type Memories**
  - Type: ModelType
  - Description: Memory nodes for each model type
  - Observations:
    - Stores model schemas
    - Tracks model usage statistics
    - Maintains model relationships
  - Relations:
    - Connected to: Model Root
    - Connected to: Instance Memories

- **Instance Memories**
  - Type: Instance
  - Description: Memory nodes for model instances
  - Observations:
    - Stores instance data
    - Tracks instance state
    - Maintains instance relationships
  - Relations:
    - Connected to: Model Type Memories
    - Connected to: Validation Memories

### Memory Integration
The model system integrates with the project memory through:

1. **Schema Tracking**
   - Model schemas are stored in memory with:
     - Attributes
     - Validations
     - Relationships
     - Callbacks

2. **Instance Tracking**
   - Model instances are tracked in memory with:
     - Instance data
     - State changes
     - Validation status
     - Relationships

3. **Query Tracking**
   - Model queries are logged in memory with:
     - Query type
     - Parameters
     - Execution time
     - Result count

4. **Validation Tracking**
   - Model validations are stored in memory with:
     - Validation type
     - Status
     - Error messages
     - Context

### Memory Access Patterns
The model system accesses memory through:
- Schema retrieval
- Instance tracking
- Query optimization
- Validation analysis

### Example Memory Query
```ruby
# Query model memory for channel schema
channel_memory = Memory.query(
  type: 'ModelType',
  name: 'Channel'
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