# Models Documentation

## 1. Model Architecture

### 1.1 Class Structure
```mermaid
reference: model-architecture
```

### 1.2 Validation Flow
```mermaid
reference: model-validation-flow
```

## 2. Core Models

### 2.1 Channel Model
```ruby
class Channel < ApplicationRecord
  # Attributes
  attribute :youtube_id, :string
  attribute :title, :string
  attribute :description, :text
  attribute :subscriber_count, :integer
  attribute :view_count, :integer
  attribute :video_count, :integer

  # Associations
  has_many :videos, dependent: :destroy
  has_many :analytics_reports
  belongs_to :user

  # Validations
  validates :youtube_id, presence: true, uniqueness: true
  validates :title, presence: true
  validate :valid_youtube_channel

  # Callbacks
  before_validation :normalize_youtube_id
  after_create :fetch_channel_data
end
```

### 2.2 Video Model
```ruby
class Video < ApplicationRecord
  # Attributes
  attribute :youtube_id, :string
  attribute :title, :string
  attribute :description, :text
  attribute :view_count, :integer
  attribute :like_count, :integer
  attribute :comment_count, :integer

  # Associations
  belongs_to :channel
  has_many :analytics_reports, dependent: :destroy

  # Validations
  validates :youtube_id, presence: true, uniqueness: true
  validates :title, presence: true

  # Scopes
  scope :popular, -> { where('view_count > ?', 1000) }
  scope :recent, -> { where('created_at > ?', 7.days.ago) }
end
```

## 3. Validation Patterns

### 3.1 Custom Validators
```ruby
module YoutubeChannelValidator
  extend ActiveSupport::Concern

  included do
    validate :valid_youtube_channel
  end

  private

  def valid_youtube_channel
    return if youtube_id.blank?

    unless YouTubeApiService.channel_exists?(youtube_id)
      errors.add(:youtube_id, "is not a valid YouTube channel")
    end
  end
end
```

### 3.2 Model Callbacks
```ruby
class AnalyticsReport < ApplicationRecord
  before_validation :set_date_range
  after_create :process_analytics
  before_save :calculate_metrics

  private

  def set_date_range
    self.end_date ||= Time.current
    self.start_date ||= 1.month.ago
  end
end
```

## 4. Query Interface

### 4.1 Scopes
```ruby
class Channel < ApplicationRecord
  scope :active, -> { where('last_sync_at > ?', 24.hours.ago) }
  scope :popular, -> { where('subscriber_count > ?', 1000) }
  scope :trending, -> { 
    joins(:analytics_reports)
    .where('analytics_reports.created_at > ?', 7.days.ago)
    .order('analytics_reports.views DESC')
  }
end
```

### 4.2 Custom Finders
```ruby
module ChannelFinder
  def find_by_youtube_url(url)
    youtube_id = extract_youtube_id(url)
    find_by(youtube_id: youtube_id)
  end

  private

  def extract_youtube_id(url)
    # Implementation
  end
end
```

## 5. Database Schema

### 5.1 Migrations
```ruby
class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.string :youtube_id, null: false, index: { unique: true }
      t.string :title
      t.text :description
      t.integer :subscriber_count
      t.integer :view_count
      t.integer :video_count
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
```

### 5.2 Indexes
```ruby
add_index :videos, [:channel_id, :youtube_id]
add_index :analytics_reports, [:reportable_type, :reportable_id]
```

## 6. Performance Optimization

### 6.1 Counter Cache
```ruby
class Video < ApplicationRecord
  belongs_to :channel, counter_cache: true
end
```

### 6.2 Eager Loading
```ruby
Channel.includes(:videos, :analytics_reports)
      .where(active: true)
```

## 7. Testing

### 7.1 Model Specs
```ruby
RSpec.describe Channel, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:youtube_id) }
    it { should validate_uniqueness_of(:youtube_id) }
  end

  describe 'associations' do
    it { should have_many(:videos) }
    it { should have_many(:analytics_reports) }
    it { should belong_to(:user) }
  end
end
```

### 7.2 Factory Definitions
```ruby
FactoryBot.define do
  factory :channel do
    sequence(:youtube_id) { |n| "CHANNEL#{n}" }
    title { "Test Channel" }
    description { "Test Description" }
    subscriber_count { 1000 }
    view_count { 5000 }
    video_count { 100 }

    association :user
  end
end
```

## 8. Best Practices

### 8.1 Model Guidelines
- Keep models skinny, controllers thin
- Use concerns for shared functionality
- Validate at the model layer
- Use callbacks sparingly
- Keep scopes focused and composable

### 8.2 Performance Tips
- Use counter caches for counts
- Index frequently queried columns
- Eager load associations when needed
- Use batch processing for large datasets

## Notes
- All models inherit from ApplicationRecord
- Validations happen before save
- Use transactions for complex operations
- Monitor model performance metrics