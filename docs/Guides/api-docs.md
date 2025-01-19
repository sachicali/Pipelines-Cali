# API Documentation

## Channels Controller

### `POST /api/v1/channels/analyze`

Starts the analysis of a YouTube channel.

**Parameters:**

*   `channel_id` (String, required): The ID of the YouTube channel to analyze.

**Response:**

```json
{
  "message": "Analysis started",
  "channel_id": "UC_test_channel",
  "status": "processing"
}
```

### `GET /api/v1/channels/:channel_id/status`

Gets the status of a channel analysis.

**Parameters:**

*   `channel_id` (String, required): The ID of the YouTube channel.

**Response:**

```json
{
  "channel_id": "UC_test_channel",
  "analysis": "pending",
  "dashboard": "pending",
  "recommendations": "pending"
}
```

### `GET /api/v1/channels/:channel_id/results`

Gets the analysis results for a channel.

**Parameters:**

*   `channel_id` (String, required): The ID of the YouTube channel.

**Response:**

```json
{
  "analysis": { ... },
  "dashboard": { ... },
  "recommendations": { ... }
}
```

### `GET /api/v1/channels/:channel_id/dashboard`

Gets the dashboard data for a channel.

**Parameters:**

*   `channel_id` (String, required): The ID of the YouTube channel.

**Response:**

```json
{
  "metrics": { ... },
  "chartData": { ... }
}
```

### `GET /api/v1/channels/:channel_id/competitors`

Gets the competitor data for a channel.

**Parameters:**

*   `channel_id` (String, required): The ID of the YouTube channel.

**Response:**

```json
{
  "competitors": [
    {
      "name": "Tech Innovators",
      "subscribers": 1500000,
      "outlierVideos": [
        { "title": "AI Revolution", "views": 2300000 },
        { "title": "Quantum Computing", "views": 1800000 }
      ]
    },
    {
      "name": "Code Masters",
      "subscribers": 850000,
      "outlierVideos": [
        { "title": "React Advanced Patterns", "views": 1100000 },
        { "title": "Node.js Performance", "views": 950000 }
      ]
    }
  ]
}
```

### `GET /api/v1/channels/:channel_id/notifications`

Gets the notifications for a channel.

**Parameters:**

*   `channel_id` (String, required): The ID of the YouTube channel.

**Response:**

```json
{
  "notifications": [
    { "title": "New Subscriber", "description": "You gained a new subscriber: JohnDoe123" },
    { "title": "Video Performance", "description": "Your video \"React Tutorial\" is trending" },
    { "title": "Comment Mention", "description": "You were mentioned in a comment" }
  ]
}
```

### `POST /api/v1/channels/import`

Imports a YouTube channel.

**Parameters:**

*   `channel_id` (String, required): The ID of the YouTube channel to import.

**Response:**

```json
{
  "message": "Channel import started",
  "channel_id": "UC_test_channel",
  "status": "processing"
}
```

## Users Controller

### `GET /api/v1/users`

Gets all users.

**Response:**

```json
[
  {
    "id": 1,
    "name": "John Doe",
    "email": "john.doe@example.com"
  },
  {
    "id": 2,
    "name": "Jane Smith",
    "email": "jane.smith@example.com"
  }
]
```

### `POST /api/v1/users/login`

Logs in a user.

**Parameters:**

*   `email` (String, required): The email of the user.
*   `password` (String, required): The password of the user.

**Response:**

```json
{
  "message": "Login successful",
  "user": {
    "id": 1,
    "name": "Test User",
    "email": "test@example.com"
  }
}
```

### `POST /api/v1/users/register`

Registers a new user.

**Parameters:**

*   `name` (String, required): The name of the user.
*   `email` (String, required): The email of the user.
*   `password` (String, required): The password of the user.

**Response:**

```json
{
  "message": "Registration successful",
  "user": {
    "id": 2,
    "name": "New User",
    "email": "new@example.com"
  }
}