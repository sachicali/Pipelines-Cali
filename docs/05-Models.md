# Models Documentation

## 1. Core Models

### 1.1 Channel Model
- Location: `app/models/channel.rb`
- Attributes:
  - `youtube_id` - YouTube channel ID
  - `title` - Channel title
  - `description` - Channel description
  - `subscriber_count` - Number of subscribers
  - `view_count` - Total views
  - `video_count` - Number of videos
- Associations:
  - Has many videos
  - Has many analytics reports
  - Belongs to user

### 1.2 Video Model
- Location: `app/models/video.rb`
- Attributes:
  - `youtube_id` - YouTube video ID
  - `title` - Video title
  - `description` - Video description
  - `view_count` - Number of views
  - `like_count` - Number of likes
  - `comment_count` - Number of comments
- Associations:
  - Belongs to channel
  - Has many analytics reports

### 1.3 AnalyticsReport Model
- Location: `app/models/analytics_report.rb`
- Attributes:
  - `start_date` - Report start date
  - `end_date` - Report end date
  - `views` - Number of views
  - `watch_time` - Total watch time
  - `subscribers_gained` - New subscribers
  - `subscribers_lost` - Lost subscribers
- Associations:
  - Belongs to channel
  - Belongs to video

### 1.4 Recommendation Model
- Location: `app/models/recommendation.rb`
- Attributes:
  - `video_id` - Recommended video ID
  - `score` - Recommendation score
  - `reason` - Recommendation reason
- Associations:
  - Belongs to channel
  - Belongs to user

### 1.5 ApplicationRecord
- `app/models/application_record.rb` - Base model class

### 1.6 Concerns
- `app/models/concerns/youtube_channel_validator.rb` - YouTube channel validation

## 2. Model Responsibilities

### 2.1 Data Validation
- Validate channel data
- Ensure data integrity
- Enforce business rules

### 2.2 Relationships
- Define model associations
- Manage data relationships
- Handle cascading operations

### 2.3 Callbacks
- Before/after actions
- Data transformation
- State management

## 3. Validation Patterns

### 3.1 YouTube Channel Validation
```ruby
class Channel < ApplicationRecord
  include YoutubeChannelValidator

  validates :channel_id, presence: true
  validate :valid_youtube_channel
end
```

### 3.2 Custom Validations
```ruby
class Metric < ApplicationRecord
  validate :positive_values

  private

  def positive_values
    errors.add(:base, 'Values must be positive') if value <= 0
  end
end
```

## 4. Query Interface
- Active Record queries
- Scopes
- Custom finders

## 5. Memory Context

### 5.1 Model Memory Structure
The model memory is organized as follows:

- **5.1.1 Model Root**
  - Type: Model
  - Description: Root node for all model-related memory
  - Relations:
    - Connected to: Main Project Memory
    - Connected to: Model Type Memories

- **5.1.2 Model Type Memories**
  - Type: ModelType
  - Description: Memory nodes for each model type
  - Observations:
    - Stores model schemas
    - Tracks model usage statistics
    - Maintains model relationships
  - Relations:
    - Connected to: Model Root
    - Connected to: Instance Memories

- **5.1.3 Instance Memories**
  - Type: Instance
  - Description: Memory nodes for model instances
  - Observations:
    - Stores instance data
    - Tracks instance state
    - Maintains instance relationships
  - Relations:
    - Connected to: Model Type Memories
    - Connected to: Validation Memories

### 5.2 Memory Integration
The model system integrates with the project memory through:

1.  **5.2.1 Model Tracking**
   - Each model operation is logged in memory with:
     - Model type
     - Operation type (create/update/delete)
     - Attributes changed
     - Timestamp

2.  **5.2.2 Schema Tracking**
   - Model schemas are stored in memory with:
     - Attributes
     - Validations
     - Relationships
     - Callbacks

3.  **5.2.3 Association Tracking**
   - Model associations are stored in memory with:
     - Association type
     - Related models
     - Operation statistics
     - Performance metrics

4.  **5.2.4 Validation Tracking**
   - Model validations are stored in memory with:
     - Validation rules
     - Validation errors
     - Error rates
     - Common failure patterns

5.  **5.2.5 Query Tracking**
   - Model queries are stored in memory with:

6.  **5.2.6 Instance Tracking**
   - Model instances are tracked in memory with:
     - Instance data
     - State changes
     - Validation status
     - Relationships

7.  **5.2.7 Query Tracking**
   - Model queries are logged in memory with:
     - Query type
     - Parameters
     - Execution time
     - Result count

8.  **5.2.8 Validation Tracking**
   - Model validations are stored in memory with:
     - Validation type
     - Status
     - Error messages
     - Context

### 5.3 Memory Access Patterns
The model system accesses memory through:
- Schema retrieval
- Instance tracking
- Query optimization
- Validation analysis

### 5.4 Example Memory Query
```ruby
# Query model memory for channel schema
channel_memory = Memory.query(
  type: 'ModelType',
  name: 'Channel'
)

# Query models memory for Video associations
video_association_memory = Memory.query(
  type: 'Association',
  model: 'Video'
)
```

## 6. Database Schema and Seed Data

### 6.1 Database Schema
The database schema is defined in `db/schema.rb`. This file is auto-generated from the current state of the database and should not be edited directly. Instead, use Active Record migrations to incrementally modify the database and then regenerate the schema definition.

### 6.2 Seed Data
The seed data for initial database population is defined in `db/seeds.rb`. This file ensures the existence of records required to run the application in every environment (production, development, test). The code here should be idempotent so that it can be executed at any point in every environment. The data can then be loaded with the `bin/rails db:seed` command (or created alongside the database with `db:setup`).

### 6.3 Example Seed Data
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