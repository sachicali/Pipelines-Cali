sequenceDiagram
    participant User
    participant GUI
    participant API
    participant Service
    participant Model
    participant Database
    participant Memory
    User->>GUI: Request data
    GUI->>API: API Request
    API->>Memory: Log request
    API->>Service: Call Service
    Service->>Memory: Track service execution
    Service->>Model: Fetch Data
    Model->>Database: Query Database
    Database-->>Model: Return Data
    Model-->>Service: Return Data
    Service->>Memory: Track service results
    Service-->>API: Return Data
    API->>Memory: Log response
    API-->>GUI: Return Data
    GUI-->>User: Display Data