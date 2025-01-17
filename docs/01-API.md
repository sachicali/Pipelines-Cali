# API Documentation

## 1. API Endpoints

### 1.1 API Version 1

#### 1.1.1 Controllers
- `app/controllers/api/v1/` - Contains version 1 API controllers
  - `analytics_controller.rb` - Handles YouTube analytics endpoints
  - `channel_controller.rb` - Manages channel data endpoints
  - `recommendations_controller.rb` - Provides recommendation endpoints

#### 1.1.2 Routes
API routes are defined in `config/routes.rb`:
```ruby
namespace :api do
  namespace :v1 do
    resources :analytics, only: [:index, :show]
    resources :channels, only: [:index, :show, :create]
    resources :recommendations, only: [:index]
  end
end
```

#### 1.1.3 Authentication
Authentication is handled via API tokens:
- Tokens are generated for each user
- Required for all endpoints except public analytics
- Configured in `config/initializers/api_authentication.rb`

#### 1.1.4 Error Handling
API errors follow a standardized format:
- 400 Bad Request - Invalid parameters
- 401 Unauthorized - Missing/invalid token
- 404 Not Found - Resource not found
- 429 Too Many Requests - Rate limit exceeded
- 500 Internal Server Error - Server-side error

#### 1.1.5 Rate Limiting
API rate limits are configured in `config/initializers/rate_limiting.rb`:
- 100 requests/minute for authenticated users
- 10 requests/minute for unauthenticated users
- Redis-backed rate limiting

#### 1.1.6 Example Requests
```bash
# Get channel analytics
curl -X GET http://localhost:3000/api/v1/analytics/123 \
  -H "Authorization: Bearer YOUR_API_TOKEN"

# Create new channel
curl -X POST http://localhost:3000/api/v1/channels \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_API_TOKEN" \
  -d '{"channel_id":"UC1234567890"}'

# Get recommendations
curl -X GET http://localhost:3000/api/v1/recommendations \
  -H "Authorization: Bearer YOUR_API_TOKEN"
```

#### 1.1.7 Response Format
All API responses follow the format:
```json
{
  "data": {
    "id": "123",
    "type": "analytics",
    "attributes": {
      "views": 1000,
      "subscribers": 500
    }
  },
  "meta": {
    "request_id": "abc123",
    "timestamp": "2025-01-18T02:32:08Z"
  },
  "errors": []
}
```

## 2. Memory Context

### 2.1 API Memory Structure
The API memory is organized as follows:

- **2.1.1 API Root**
  - Type: API
  - Description: Root node for all API-related memory
  - Relations:
    - Connected to: Main Project Memory
    - Connected to: Version 1 Memory

- **2.1.2 Version 1 Memory**
  - Type: API Version
  - Description: Memory node for API version 1
  - Observations:
    - Contains controllers, routes, and authentication details
    - Stores rate limiting configurations
    - Maintains error handling patterns
  - Relations:
    - Connected to: API Root
    - Connected to: Endpoint Memories

### 2.2 Memory Integration
The API system integrates with the project memory through:

1.  **2.2.1 Request Logging**
   - Each API request is logged in memory with:
     - Timestamp
     - Endpoint
     - Parameters
     - Response status

2.  **2.2.2 Error Tracking**
   - API errors are stored in memory with:
     - Error type
     - Stack trace
     - Request context

3.  **2.2.3 Rate Limiting**
   - Rate limit usage is tracked in memory with:
     - Client identifier
     - Request count
     - Time window

4.  **2.2.4 Endpoint Documentation**
   - API endpoint details are stored in memory with:
     - Path
     - HTTP method
     - Parameters
     - Response format
     - Example requests

### 2.3 Memory Access Patterns
The API system accesses memory through:
- Direct memory queries for rate limiting
- Error logging to memory
- Request tracking for analytics
- Documentation retrieval for API explorer

### 2.4 Example Memory Query
```ruby
# Query API memory for endpoint details
endpoint_memory = Memory.query(
  type: 'APIEndpoint',
  path: '/api/v1/analytics'
)