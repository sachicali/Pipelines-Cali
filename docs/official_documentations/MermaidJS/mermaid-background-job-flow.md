sequenceDiagram
    participant User
    participant GUI
    participant API
    participant Worker
    participant Model
    participant Database
    participant Memory
    User->>GUI: Trigger action
    GUI->>API: API Request
    API->>Memory: Log request
    API->>Worker: Enqueue Job
    Worker->>Memory: Track job execution
    Worker->>Model: Process Data
    Model->>Database: Update Database
    Database-->>Model: Return Data
    Model-->>Worker: Return Data
    Worker->>Memory: Track job results
    Worker-->>API: Notify Completion
    API->>Memory: Log completion
    API-->>GUI: Update UI
    GUI-->>User: Display Update