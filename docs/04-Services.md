# Services Documentation

## 1. Core Services

### 1.1 YouTube API Service
- Location: `app/services/youtube_api_service.rb`
- Responsibilities:
  - Channel data retrieval
  - Video analytics collection
  - Subscription management
  - Rate limit handling

### 1.2 Analytics Processing Service
- Location: `app/services/analytics_processing_service.rb`
- Responsibilities:
  - Data aggregation
  - Trend analysis
  - Report generation
  - Anomaly detection

### 1.3 Recommendation Service
- Location: `app/services/recommendation_service.rb`
- Responsibilities:
  - Content analysis
  - Recommendation generation
  - Personalization
  - Performance tracking

### 1.4 Notification Service
- Location: `app/services/notification_service.rb`
- Responsibilities:
  - Email notifications
  - Push notifications
  - Notification templates
  - Delivery tracking

### 1.5 Channel Service
- `app/services/pipeline/channel_service.rb` - Main channel service
- Responsibilities:
  1. Channel data retrieval
  2. Channel validation
  3. Channel analysis coordination

### 1.6 Cache Service
- `lib/pipeline/services/cache_service.rb` - Caching service
- Responsibilities:
  - Data caching
  - Cache invalidation
  - Cache expiration

### 1.7 Metrics Service
- `lib/pipeline/services/metrics_service.rb` - Metrics service
- Responsibilities:
  - Metric collection
  - Metric analysis
  - Metric storage

## 2. Service Patterns

### 2.1 Service Initialization
```ruby
service = Pipeline::ChannelService.new(params)
```

### 2.2 Service Execution
```ruby
result = service.call
```

### 2.3 Error Handling
```ruby
begin
  service.call
rescue Pipeline::Errors::ServiceError => e
  # Handle error
end
```

## 3. Service Configuration
- Configured in `lib/pipeline/configuration.rb`
- Environment-specific settings in `config/environments/`

## 4. Memory Context

### 4.1 Service Memory Structure
The service memory is organized as follows:

- **4.1.1 Service Root**
  - Type: Service
  - Description: Root node for all service-related memory
  - Relations:
    - Connected to: Main Project Memory
    - Connected to: Service Type Memories

- **4.1.2 Service Type Memories**
  - Type: ServiceType
  - Description: Memory nodes for each service type
  - Observations:
    - Stores service configurations
    - Tracks service usage statistics
    - Maintains service dependencies
  - Relations:
    - Connected to: Service Root
    - Connected to: Service Instance Memories

- **4.1.3 Service Instance Memories**
  - Type: ServiceInstance
  - Description: Memory nodes for individual service instances
  - Observations:
    - Stores instance parameters
    - Tracks instance execution
    - Maintains instance results
  - Relations:
    - Connected to: Service Type Memories
    - Connected to: Cache Memories

### 4.2 Memory Integration
The service system integrates with the project memory through:

1.  **4.2.1 Service Tracking**
   - Each service execution is logged in memory with:
     - Service type
     - Start time
     - End time
     - Status
     - Results

2.  **4.2.2 Cache Management**
   - Cache operations are stored in memory with:
     - Cache key
     - Operation type (read/write)
     - Data size
     - Timestamp

3.  **4.2.3 Metrics Collection**
   - Service metrics are tracked in memory with:
     - Metric type
     - Value
     - Timestamp
     - Context

4.  **4.2.4 Error Tracking**
   - Service errors are stored in memory with:
     - Error type
     - Stack trace
     - Service context
     - Timestamp

### 4.3 Memory Access Patterns
The service system accesses memory through:
- Service execution tracking
- Cache performance monitoring
- Metrics collection and analysis
- Error logging and analysis

### 4.4 Example Memory Query
```ruby
# Query service memory for channel service statistics
channel_memory = Memory.query(
  type: 'ServiceType',
  name: 'ChannelService'
)