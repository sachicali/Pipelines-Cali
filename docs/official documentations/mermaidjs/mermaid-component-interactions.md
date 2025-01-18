graph LR
    A[API Layer] --> B[Service Layer]
    B --> C[Model Layer]
    C --> D[Database]
    A --> E[Worker Layer]
    E --> C
    E --> F[Memory Layer]
    F --> A
    F --> B
    F --> C
    F --> E
    style A fill:#f9f,stroke:#333,stroke-width:2px
    style B fill:#ccf,stroke:#333,stroke-width:2px
    style C fill:#cfc,stroke:#333,stroke-width:2px
    style D fill:#fcc,stroke:#333,stroke-width:2px
    style E fill:#ccf,stroke:#333,stroke-width:2px
    style F fill:#fcf,stroke:#333,stroke-width:2px