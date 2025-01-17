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