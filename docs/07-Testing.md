# Testing Documentation

## Test Setup

### Test Helpers
- `test/test_helper.rb` - Main test helper
- `spec/spec_helper.rb` - RSpec helper
- `test/application_system_test_case.rb` - System test base

### Test Configuration
- `config/environments/test.rb` - Test environment settings
- `config/database.yml` - Test database configuration

## Test Types

### Unit Tests
- Model tests in `test/models/`
- Service tests in `spec/pipeline/services/`

### Integration Tests
- Controller tests in `test/controllers/`
- System tests in `test/system/`

### Feature Tests
- Channel analysis tests in `spec/pipeline/channel_analyzer_spec.rb`
- YouTube analytics tests in `spec/pipeline/youtube_analytics_spec.rb`

## Testing Patterns

### RSpec Examples
```ruby
describe Pipeline::ChannelAnalyzer do
  let(:analyzer) { described_class.new(channel) }

  it 'returns valid metrics' do
    expect(analyzer.metrics).to be_a(Hash)
  end
end
```

### Minitest Examples
```ruby
class ChannelTest < ActiveSupport::TestCase
  test 'valid channel' do
    channel = Channel.new(valid_attributes)
    assert channel.valid?
  end
end
```

### Test Data
- Fixtures in `test/fixtures/`
- Factory patterns
- Test doubles

## Memory Context

### Testing Memory Structure
The testing memory is organized as follows:

- **Testing Root**
  - Type: Testing
  - Description: Root node for all testing-related memory
  - Relations:
    - Connected to: Main Project Memory
    - Connected to: Test Type Memories

- **Test Type Memories**
  - Type: TestType
  - Description: Memory nodes for each test type
  - Observations:
    - Stores test configurations
    - Tracks test execution statistics
    - Maintains test dependencies
  - Relations:
    - Connected to: Testing Root
    - Connected to: Test Suite Memories

- **Test Suite Memories**
  - Type: TestSuite
  - Description: Memory nodes for test suites
  - Observations:
    - Stores suite configurations
    - Tracks suite execution
    - Maintains suite results
  - Relations:
    - Connected to: Test Type Memories
    - Connected to: Test Case Memories

### Memory Integration
The testing system integrates with the project memory through:

1. **Test Execution Tracking**
   - Each test execution is logged in memory with:
     - Test type
     - Start time
     - End time
     - Status
     - Results

2. **Coverage Tracking**
   - Test coverage is stored in memory with:
     - Coverage percentage
     - Covered files
     - Uncovered lines
     - Timestamp

3. **Performance Tracking**
   - Test performance metrics are tracked in memory with:
     - Execution time
     - Memory usage
     - Failure rate
     - Success rate

4. **Data Management**
   - Test data usage is stored in memory with:
     - Data type (fixtures/factories/doubles)
     - Usage count
     - Creation time
     - Dependencies

### Memory Access Patterns
The testing system accesses memory through:
- Test execution tracking
- Coverage analysis
- Performance monitoring
- Data management

### Example Memory Query
```ruby
# Query testing memory for unit test statistics
unit_memory = Memory.query(
  type: 'TestType',
  name: 'Unit'
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