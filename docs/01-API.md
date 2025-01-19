# API Documentation

## 1. Architecture Overview

### 1.1 System Architecture
```mermaid
reference: api-architecture
```

The API is built on a layered architecture consisting of:
- Controllers for request handling
- Middleware for authentication and rate limiting
- Services for business logic
- Data layer for storage and caching

### 1.2 Request Flow
```mermaid
reference: api-request-flow
```

## 2. API Endpoints (v1)

### 2.1 Controllers
Located in `app/controllers/api/v1/`:
- `analytics_controller.rb`: YouTube analytics endpoints
- `channel_controller.rb`: Channel data management
- `recommendations_controller.rb`: Content recommendations

### 2.2 Routes
```ruby
# config/routes.rb
namespace :api do
  namespace :v1 do
    resources :analytics, only: [:index, :show]
    resources :channels, only: [:index, :show, :create]
    resources :recommendations, only: [:index]
  end
end
```

## 3. Authentication & Security

### 3.1 Authentication
- Bearer token authentication
- Tokens required for all non-public endpoints
- Configuration: `config/initializers/api_authentication.rb`

### 3.2 Rate Limiting
- Authenticated: 100 requests/minute
- Unauthenticated: 10 requests/minute
- Redis-backed implementation
- Configuration: `config/initializers/rate_limiting.rb`

## 4. Error Handling

### 4.1 Error Codes
```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human readable message",
    "details": { }
  }
}
```

### 4.2 Standard Errors
| Code | Description           | Cause                    |
|------|--------------------- |--------------------------|
| 400  | Bad Request          | Invalid parameters       |
| 401  | Unauthorized         | Missing/invalid token    |
| 404  | Not Found           | Resource doesn't exist   |
| 429  | Too Many Requests    | Rate limit exceeded      |
| 500  | Internal Server Error| Server-side failure      |

## 5. Example Usage

### 5.1 Channel Analytics
```bash
# Get channel analytics
curl -X GET http://localhost:3000/api/v1/analytics/123 \
  -H "Authorization: Bearer YOUR_API_TOKEN"
```

Response:
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
  }
}
```

### 5.2 Create Channel
```bash
curl -X POST http://localhost:3000/api/v1/channels \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_API_TOKEN" \
  -d '{"channel_id":"UC1234567890"}'
```

### 5.3 Get Recommendations
```bash
curl -X GET http://localhost:3000/api/v1/recommendations \
  -H "Authorization: Bearer YOUR_API_TOKEN"
```

## 6. Rate Limiting Headers
```http
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 99
X-RateLimit-Reset: 1624291200
```

## 7. Development Setup

### 7.1 Prerequisites
- Ruby 3.2+
- Redis for rate limiting
- PostgreSQL for data storage

### 7.2 Configuration
1. Set up authentication:
```ruby
# config/initializers/api_authentication.rb
config.token_auth.enabled = true
config.token_auth.header = 'Authorization'
```

2. Configure rate limiting:
```ruby
# config/initializers/rate_limiting.rb
config.rate_limit.authenticated = 100
config.rate_limit.unauthenticated = 10
```

## 8. Testing
- Request specs in `spec/requests/api/v1/`
- Controller specs in `spec/controllers/api/v1/`
- Integration tests in `spec/integration/api/`

## Notes
- All timestamps are in ISO8601 format
- Rate limits are per-client, based on IP and token
- API versioning uses URL namespacing
- Request IDs are included in all responses