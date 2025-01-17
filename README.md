# Pipeline - YouTube Analytics System

A Ruby-based YouTube analytics system for processing and analyzing channel data.

## Overview

Pipeline is a powerful analytics tool designed to process YouTube channel data, providing insights, visualizations, and recommendations for content creators.

## Documentation

Comprehensive documentation is available in the `docs/` directory:

- [API Documentation](docs/01-API.md)
- [GUI Documentation](docs/02-GUI.md)
- [Workers Documentation](docs/03-Workers.md)
- [Services Documentation](docs/04-Services.md)
- [Models Documentation](docs/05-Models.md)
- [Configuration Documentation](docs/06-Configuration.md)
- [Testing Documentation](docs/07-Testing.md)
- [Memory Documentation](docs/08-Memory.md)
- [Bin Scripts Documentation](docs/09-Bin-Scripts.md)
- [Changelog](CHANGELOG.md)

## Features

- Channel performance analysis
- Data visualization using Gruff
- Automated recommendations engine
- Background job processing
- Modular and maintainable architecture
- Rails integration support

## Prerequisites

- Ruby (see `.ruby-version` for specific version)
- Redis (for background jobs)
- Node.js (see `.node-version` for specific version)
- SQLite3

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd pipeline
```

2. Install dependencies:
```bash
bundle install
yarn install
```

3. Set up environment variables:
```bash
cp .env.example .env
```
Edit `.env` with your configuration

4. Set up the database:
```bash
bin/rails db:setup
```

## Configuration

Configure the application in your environment:

```ruby
Pipeline.configure do |config|
  config.youtube_api_key = ENV['YOUTUBE_API_KEY']
  config.storage_path = 'tmp/pipeline'
end
```

## Usage

### Starting the Application

1. Start the Rails server:
```bash
bin/dev
```

2. Start Sidekiq for background jobs:
```bash
bundle exec sidekiq
```

### Running Analysis

```ruby
# Process a channel asynchronously
channel_id = 'YOUTUBE_CHANNEL_ID'
Pipeline::Workers::ChannelAnalysisWorker.perform_async(channel_id)

# Get results synchronously
analyzer = Pipeline::ChannelAnalyzer.new(channel_id)
results = analyzer.analyze
```

## Bin Scripts

The `bin/` directory contains various utility scripts:

- `analyze_channel`: Main script for analyzing YouTube channels
- `dev`: Starts the development environment
- `docker-entrypoint`: Docker entrypoint script
- `jobs`: Starts Sidekiq for background jobs
- `kamal`: Deployment management
- `rails`: Rails CLI wrapper
- `rake`: Rake task runner
- `rubocop`: Code style checker
- `setup`: Initial setup script
- `test_app`: Test application runner

## Testing

Run the test suite:
```bash
bundle exec rspec
```

## Development

The application uses:
- RSpec for testing
- RuboCop for code style enforcement
- Sidekiq for background job processing
- Tailwind CSS for styling

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License.

---
Last updated: 2025-01-18