# Workers Documentation

## Background Jobs

### Core Workers
- `app/jobs/channel_analysis_job.rb` - Channel analysis job
- `lib/pipeline/workers/channel_analysis_worker.rb` - Channel analysis worker
- `lib/pipeline/workers/data_visualization_worker.rb` - Data visualization worker
- `lib/pipeline/workers/notification_worker.rb` - Notification worker
- `lib/pipeline/workers/recommendation_worker.rb` - Recommendation worker
- `lib/pipeline/workers/visualization_worker.rb` - Visualization worker

### Base Worker
- `lib/pipeline/workers/base_worker.rb` - Base worker class

### Job Configuration
- `config/queue.yml` - Queue configuration
- `config/recurring.yml` - Recurring jobs configuration

### Execution
- `bin/jobs` - Job execution script
- `config/sidekiq.rb` - Sidekiq configuration

## Worker Responsibilities

### Channel Analysis
1. Fetch channel data
2. Analyze metrics
3. Store results

### Data Visualization
1. Process raw data
2. Generate visualizations
3. Cache results

### Notifications
1. Monitor channels
2. Detect changes
3. Send alerts

## Memory Context

### Worker Memory Structure
The worker memory is organized as follows:

- **Worker Root**
  - Type: Worker
  - Description: Root node for all worker-related memory
  - Relations:
    - Connected to: Main Project Memory
    - Connected to: Worker Type Memories

- **Worker Type Memories**
  - Type: WorkerType
  - Description: Memory nodes for each worker type
  - Observations:
    - Stores worker configurations
    - Tracks worker execution statistics
    - Maintains worker dependencies
  - Relations:
    - Connected to: Worker Root
    - Connected to: Job Memories

- **Job Memories**
  - Type: Job
  - Description: Memory nodes for individual jobs
  - Observations:
    - Stores job parameters
    - Tracks job status
    - Maintains job results
  - Relations:
    - Connected to: Worker Type Memories
    - Connected to: Queue Memories

### Memory Integration
The worker system integrates with the project memory through:

1. **Job Tracking**
   - Each job execution is logged in memory with:
     - Job type
     - Start time
     - End time
     - Status
     - Results

2. **Queue Monitoring**
   - Queue status is stored in memory with:
     - Queue name
     - Job count
     - Processing rate
     - Error rate

3. **Worker Performance**
   - Worker performance metrics are tracked in memory with:
     - Execution time
     - Memory usage
     - Error rate
     - Success rate

4. **Recurring Jobs**
   - Recurring job schedules are stored in memory with:
     - Job type
     - Schedule
     - Last run
     - Next run

### Memory Access Patterns
The worker system accesses memory through:
- Job status tracking
- Queue monitoring
- Performance analysis
- Schedule management

### Example Memory Query
```ruby
# Query worker memory for job statistics
analysis_memory = Memory.query(
  type: 'WorkerType',
  name: 'ChannelAnalysis'
)