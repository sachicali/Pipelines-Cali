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