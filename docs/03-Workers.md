# Workers Documentation

## 1. Background Jobs

### 1.1 Core Workers
- `app/jobs/channel_analysis_job.rb` - Channel analysis job
- `lib/pipeline/workers/channel_analysis_worker.rb` - Channel analysis worker
- `lib/pipeline/workers/data_visualization_worker.rb` - Data visualization worker
- `lib/pipeline/workers/notification_worker.rb` - Notification worker
- `lib/pipeline/workers/recommendations_worker.rb` - Recommendation worker
- `lib/pipeline/workers/visualization_worker.rb` - Visualization worker

### 1.2 Base Worker
- `lib/pipeline/workers/base_worker.rb` - Base worker class

### 1.3 Job Configuration
- `config/queue.yml` - Queue configuration
- `config/recurring.yml` - Recurring jobs configuration

### 1.4 Execution
- `bin/jobs` - Job execution script
- `config/sidekiq.rb` - Sidekiq configuration

## 2. Worker Responsibilities

### 2.1 Channel Analysis
1. Fetch channel data
2. Analyze metrics
3. Store results

### 2.2 Data Visualization
1. Process raw data
2. Generate visualizations
3. Cache results

### 2.3 Notifications
1. Monitor channels
2. Detect changes
3. Send alerts

## 3. Background Jobs

### 3.1 Job Types
- `AnalyticsJob` - Processes YouTube analytics data
- `ChannelSyncJob` - Synchronizes channel data
- `RecommendationJob` - Generates video recommendations
- `NotificationJob` - Handles user notifications

### 3.2 Job Queues
- `default` - General purpose jobs
- `analytics` - Analytics processing jobs
- `recommendations` - Recommendation generation jobs
- `notifications` - Notification delivery jobs

### 3.3 Job Configuration
- Configured in `config/sidekiq.yml`
- Redis connection in `config/initializers/sidekiq.rb`
- Monitoring available at `/sidekiq`

## 4. Memory Context

### 4.1 Workers Memory Structure
The workers memory is organized as follows:

- **4.1.1 Workers Root**
  - Type: Workers
  - Description: Root node for all worker-related memory
  - Relations:
    - Connected to: Main Project Memory
    - Connected to: Job Type Memories
    - Connected to: Queue Memories

- **4.1.2 Job Type Memories**
  - Type: JobType
  - Description: Memory nodes for each job type
  - Observations:
    - Stores job configuration
    - Tracks job execution statistics
    - Maintains job dependencies
  - Relations:
    - Connected to: Workers Root
    - Connected to: Queue Memories

- **4.1.3 Queue Memories**
  - Type: Queue
  - Description: Memory nodes for each job queue
  - Observations:
    - Stores queue configuration
    - Tracks queue performance metrics
    - Maintains queue dependencies
  - Relations:
    - Connected to: Workers Root
    - Connected to: Job Type Memories

### 4.2 Memory Integration
The workers system integrates with the project memory through:

1.  **4.2.1 Job Tracking**
   - Each job execution is logged in memory with:
     - Job type
     - Execution time
     - Parameters
     - Status (success/failure)
     - Error details (if any)

2.  **4.2.2 Queue Monitoring**
   - Queue statistics are stored in memory with:
     - Queue name
     - Job count
     - Processing time
     - Error rate

3.  **4.2.3 Performance Metrics**
   - Worker performance is tracked in memory with:
     - CPU usage
     - Memory usage
     - Job throughput
     - Error rates

4.  **4.2.4 Dependency Tracking**
   - Job dependencies are stored in memory with:
     - Parent-child relationships
     - Execution order
     - Failure cascades

### 4.3 Memory Access Patterns
The workers system accesses memory through:
- Job execution tracking
- Queue performance monitoring
- Error analysis
- Dependency resolution

### 4.4 Example Memory Query
```ruby
# Query workers memory for job statistics
analytics_job_memory = Memory.query(
  type: 'JobType',
  name: 'AnalyticsJob'
)

# Query workers memory for queue performance
default_queue_memory = Memory.query(
  type: 'Queue',
  name: 'default'
)