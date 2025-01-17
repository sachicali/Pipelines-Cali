# Testing Documentation

## 1. Test Setup

### 1.1 Test Helpers
- `test/test_helper.rb` - Main test helper
- `spec/spec_helper.rb` - RSpec helper
- `test/application_system_test_case.rb` - System test base

### 1.2 Test Configuration
- `config/environments/test.rb` - Test environment settings
- `config/database.yml` - Test database configuration

## 2. Test Types

### 2.1 Unit Tests
- Location: `test/models/`
- Purpose: Test individual model functionality
- Tools: Minitest, FactoryBot
- Coverage: Model validations, associations, methods

### 2.2 Integration Tests
- Location: `test/integration/`
- Purpose: Test component interactions
- Tools: Minitest, Capybara
- Coverage: API endpoints, service interactions

### 2.3 System Tests
- Location: `test/system/`
- Purpose: Test full system behavior
- Tools: Capybara, Selenium
- Coverage: User workflows, UI interactions

### 2.4 Performance Tests
- Location: `test/performance/`
- Purpose: Test system performance
- Tools: JMeter, k6
- Coverage: API response times, database queries

## 3. Testing Patterns

### 3.1 RSpec Examples
```ruby
describe Pipeline::ChannelAnalyzer do
  let(:analyzer) { described_class.new(channel) }

  it 'returns valid metrics' do
    expect(analyzer.metrics).to be_a(Hash)
  end
end
```

### 3.2 Minitest Examples
```ruby
class ChannelTest < ActiveSupport::TestCase
  test 'valid channel' do
    channel = Channel.new(valid_attributes)
    assert channel.valid?
  end
end
```

### 3.3 Test Data
- Fixtures in `test/fixtures/`
- Factory patterns
- Test doubles

## 4. Memory Context

### 4.1 Testing Memory Structure
The testing memory is organized as follows:

- **4.1.1 Testing Root**
  - Type: Testing
  - Description: Root node for all testing-related memory
  - Relations:
    - Connected to: Main Project Memory
    - Connected to: Test Type Memories

- **4.1.2 Test Type Memories**
  - Type: TestType
  - Description: Memory nodes for each test type
  - Observations:
    - Stores test configurations
    - Tracks test execution statistics
    - Maintains test dependencies
  - Relations:
    - Connected to: Testing Root
    - Connected to: Test Suite Memories

- **4.1.3 Test Suite Memories**
  - Type: TestSuite
  - Description: Memory nodes for test suites
  - Observations:
    - Stores suite configurations
    - Tracks suite execution
    - Maintains suite results
  - Relations:
    - Connected to: Test Type Memories
    - Connected to: Test Case Memories

### 4.2 Memory Integration
The testing system integrates with the project memory through:

1.  **4.2.1 Test Execution Tracking**
   - Each test execution is logged in memory with:
     - Test type
     - Start time
     - End time
     - Status
     - Results
     - Execution time
     - Result (pass/fail)
     - Error details (if any)
     - Coverage metrics

2.  **4.2.2 Performance Tracking**
   - Test performance is tracked in memory with:
     - Execution times
     - Resource usage
     - Bottleneck analysis
     - Improvement opportunities

3.  **4.2.3 Coverage Tracking**
   - Test coverage is stored in memory with:
     - Coverage percentages
     - Untested code paths
     - Critical path analysis
     - Risk assessment

4.  **4.2.4 Failure Tracking**
   - Test failures are stored in memory with:
     - Failure patterns
     - Root cause analysis
     - Fix history
     - Regression tracking

### 4.3 Memory Access Patterns
The testing system accesses memory through:
- Test execution tracking
- Performance analysis
- Coverage monitoring
- Failure analysis

### 4.4 Example Memory Query
```ruby
# Query testing memory for unit test statistics
unit_test_memory = Memory.query(
  type: 'TestType',
  name: 'UnitTest'
)

# Query testing memory for performance metrics
performance_test_memory = Memory.query(
  type: 'TestType',
  name: 'PerformanceTest'
)
```

## 5. Database Schema and Seed Data

### 5.1 Database Schema
The database schema is defined in `db/schema.rb`. This file is auto-generated from the current state of the database and should not be edited directly. Instead, use Active Record migrations to incrementally modify the database and then regenerate the schema definition.

### 5.2 Seed Data
The seed data for initial database population is defined in `db/seeds.rb`. This file ensures the existence of records required to run the application in every environment (production, development, test). The code here should be idempotent so that it can be executed at any point in every environment. The data can then be loaded with the `bin/rails db:seed` command (or created alongside the database with `db:setup`).

### 5.3 Example Seed Data
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