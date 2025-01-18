# Implementation Details: Combining React, Rails, and Hanami

This document outlines how to combine and use React, Rails, and Hanami in a web application. While these frameworks can be used independently, this document will focus on how they can be integrated to leverage their strengths.

## 1. Overview

-   **Rails:** Provides the backend framework, handling routing, database interactions, and API endpoints.
-   **React:** Provides the frontend framework, handling UI rendering, component management, and user interactions.
-   **Hanami:** A lightweight Ruby framework that can be used for specific parts of the application, such as microservices or isolated components.

## 2. Integrating React with Rails

### 2.1 Setting up React in Rails

1.  **Use `jsbundling-rails`:** This gem allows you to use JavaScript bundlers like Webpack or esbuild with Rails.
    ```bash
    # Add jsbundling-rails to your Gemfile
    gem 'jsbundling-rails'
    bundle install
    # Install esbuild
    yarn add esbuild
    # Configure esbuild in config/initializers/assets.rb
    Rails.application.config.assets.paths << Rails.root.join('app', 'javascript')
    ```
2.  **Create React Components:** Place your React components in `app/javascript/components/`.
3.  **Render React Components:** Use the `react_component` helper in your Rails views to render React components.
    ```erb
    <%= react_component('MyComponent', { name: 'User' }) %>
    ```
4.  **Use Rails API:** Fetch data from Rails API endpoints using `fetch` or `axios` in your React components.

### 2.2 Example: Fetching Data from Rails API

```javascript
// app/javascript/components/MyComponent.jsx
import React, { useState, useEffect } from 'react';
import axios from 'axios';

function MyComponent({ name }) {
  const [data, setData] = useState(null);

  useEffect(() => {
    axios.get('/api/v1/data')
      .then(response => setData(response.data))
      .catch(error => console.error('Error fetching data:', error));
  }, []);

  return (
    <div>
      <h1>Hello, {name}!</h1>
      {data && <p>Data: {JSON.stringify(data)}</p>}
    </div>
  );
}

export default MyComponent;
```

## 3. Integrating Hanami

### 3.1 Using Hanami for Microservices

1.  **Create a Hanami Application:** Create a separate Hanami application for specific microservices or isolated components.
    ```bash
    gem install hanami
    hanami new my_hanami_app
    cd my_hanami_app
    bundle
    ```
2.  **Expose API Endpoints:** Define API endpoints in your Hanami application.
3.  **Communicate with Rails:** Use HTTP requests to communicate between your Rails application and Hanami microservices.

### 3.2 Example: Using Hanami for a Specific Service

1.  **Create a Hanami Service:** Create a service in your Hanami application.
    ```ruby
    # my_hanami_app/lib/my_hanami_app/services/my_service.rb
    module MyHanamiApp
      module Services
        class MyService
          def call(params)
            # Service logic here
            { message: "Hello from Hanami", params: params }
          end
        end
      end
    end
    ```
2.  **Expose an API Endpoint:** Create a controller in your Hanami application.
    ```ruby
    # my_hanami_app/app/controllers/my_controller.rb
    module MyHanamiApp
      module Controllers
        class MyController
          include Hanami::Action
          def call(params)
            service = MyHanamiApp::Services::MyService.new
            result = service.call(params)
            render json: result
          end
        end
      end
    end
    ```
3.  **Call from Rails:** Call the Hanami service from your Rails application.
    ```ruby
    # app/services/my_rails_service.rb
    require 'net/http'
    require 'uri'
    require 'json'

    class MyRailsService
      def call(params)
        uri = URI('http://localhost:2300/my') # Replace with your Hanami endpoint
        res = Net::HTTP.post(uri, params.to_json, 'Content-Type' => 'application/json')
        JSON.parse(res.body)
      end
    end
    ```

## 4. Combining All Three

1.  **Rails as the Main Application:** Use Rails as the main application framework, handling routing, database interactions, and overall structure.
2.  **React for the Frontend:** Use React for building interactive user interfaces, fetching data from Rails API endpoints.
3.  **Hanami for Specific Services:** Use Hanami for specific microservices or isolated components that require a lightweight framework.

## 5. Memory Management

-   **Rails Memory:** Rails uses Active Record to manage database interactions and model data.
-   **React Memory:** React manages component state and data flow using its virtual DOM.
-   **Hanami Memory:** Hanami manages data within its own context, which can be integrated with Rails memory through API calls.

## 6. Considerations

-   **Complexity:** Integrating multiple frameworks can increase complexity.
-   **Performance:** Ensure efficient communication between frameworks to avoid performance bottlenecks.
-   **Maintainability:** Maintain clear separation of concerns and follow best practices for each framework.
-   **Testing:** Implement comprehensive tests for each component and their interactions.

This document provides a starting point for combining React, Rails, and Hanami. The specific implementation details will depend on the requirements of your application.