graph LR
    A[YouTube API] --> B(YouTube API Service)
    B --> C(Analytics Processing Service)
    C --> D(Recommendation Service)
    D --> E(Notification Service)
    B --> F(Channel Service)
    F --> G(Cache Service)
    F --> H(Metrics Service)
    C --> H
    D --> H
    E --> H
    H --> I(Model Layer)
    I --> J(Database)
    style A fill:#f9f,stroke:#333,stroke-width:2px
    style B fill:#ccf,stroke:#333,stroke-width:2px
    style C fill:#cfc,stroke:#333,stroke-width:2px
    style D fill:#fcc,stroke:#333,stroke-width:2px
    style E fill:#ccf,stroke:#333,stroke-width:2px
    style F fill:#fcf,stroke:#333,stroke-width:2px
    style G fill:#ccf,stroke:#333,stroke-width:2px
    style H fill:#fcc,stroke:#333,stroke-width:2px
    style I fill:#cfc,stroke:#333,stroke-width:2px
    style J fill:#fcf,stroke:#333,stroke-width:2px