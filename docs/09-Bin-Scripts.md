# Bin Scripts Documentation

The `bin/` directory contains various utility scripts that are essential for the application's setup, development, and deployment processes.

## Main Scripts

### analyze_channel
Main script for analyzing YouTube channels. Usage:
```bash
bin/analyze_channel [CHANNEL_ID]
```

### dev
Starts the development environment, including Redis and Rails server. Usage:
```bash
bin/dev
```

### docker-entrypoint
Docker entrypoint script that prepares the container environment. Automatically runs when starting a Docker container.

### jobs
Starts Sidekiq for background job processing. Usage:
```bash
bin/jobs
```

### kamal
Deployment management script. Usage:
```bash
bin/kamal [COMMAND]
```

### rails
Rails CLI wrapper. Usage:
```bash
bin/rails [COMMAND]
```

### rake
Rake task runner. Usage:
```bash
bin/rake [TASK]
```

### rubocop
Code style checker and formatter. Usage:
```bash
bin/rubocop
```

### setup
Initial setup script that installs dependencies and prepares the application. Usage:
```bash
bin/setup
```

### test_app
Test application runner. Usage:
```bash
bin/test_app
```

## Development Workflow

### Typical Development Commands
1. Start development environment:
```bash
bin/dev
```

2. Run tests:
```bash
bin/test_app
```

3. Check code style:
```bash
bin/rubocop
```

4. Run background jobs:
```bash
bin/jobs
```

## Deployment Workflow

### Typical Deployment Commands
1. Deploy to production:
```bash
bin/kamal deploy
```

2. Rollback deployment:
```bash
bin/kamal rollback
```

3. View deployment status:
```bash
bin/kamal status
```

## Maintenance

### Updating Scripts
When adding new scripts:
1. Place them in the `bin/` directory
2. Ensure they have executable permissions
3. Document their usage in this file
4. Update the README.md with a brief description

### Testing Scripts
All scripts should be tested using:
```bash
bin/test_app