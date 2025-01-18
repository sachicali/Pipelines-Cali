# TypeScript Documentation

## Table of Contents
1. [Introduction](#introduction)
2. [Setup](#setup)
3. [Configuration](#configuration)
4. [Usage](#usage)
5. [Best Practices](#best-practices)
6. [Integration with Rails](#integration-with-rails)
7. [Common Patterns](#common-patterns)

## Introduction
This documentation covers the TypeScript integration in Pipelines-Cali. The frontend components are written in TypeScript to provide type safety and better developer experience.

## Setup
### Prerequisites
- Node.js >= 16.0.0
- Yarn >= 1.22.0

### Installation
1. Install TypeScript and type definitions:
   ```bash
   yarn add typescript @types/react @types/react-dom
   ```

2. Initialize TypeScript configuration:
   ```bash
   yarn tsc --init
   ```

3. Install additional development dependencies:
   ```bash
   yarn add -D @types/node @types/webpack-env
   ```

## Configuration
### tsconfig.json
The TypeScript configuration file is located at the project root. Key configurations include:

```json
{
  "compilerOptions": {
    "target": "es5",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "esModuleInterop": true,
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "module": "esnext",
    "moduleResolution": "node",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx"
  },
  "include": ["app/javascript/**/*"],
  "exclude": ["node_modules", "public"]
}
```

## Usage
### Running TypeScript
- Type checking:
  ```bash
  yarn tsc
  ```

- Development server:
  ```bash
  yarn dev
  ```

### Creating Components
Example TypeScript component:
```typescript
import React from 'react';

interface Props {
  title: string;
  count: number;
}

const ExampleComponent: React.FC<Props> = ({ title, count }) => {
  return (
    <div>
      <h1>{title}</h1>
      <p>Count: {count}</p>
    </div>
  );
};

export default ExampleComponent;
```

## Best Practices
1. Use strict type checking
2. Prefer interfaces over types for component props
3. Use TypeScript utility types (Partial, Pick, Omit)
4. Avoid using 'any' type
5. Use type guards for runtime type checking
6. Keep type definitions close to their usage

## Integration with Rails
### Stimulus Controllers
TypeScript Stimulus controllers are located in `app/javascript/controllers`. Example:

```typescript
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['input'];

  connect() {
    // Type-safe access to target
    const input = this.inputTarget as HTMLInputElement;
    input.value = 'Hello from TypeScript!';
  }
}
```

### Rails Helpers
TypeScript types for Rails helpers are available through the `@types/rails` package.

## Common Patterns
### Type-Safe API Calls
```typescript
interface ApiResponse {
  data: {
    id: string;
    attributes: {
      title: string;
      description: string;
    };
  };
}

async function fetchData(): Promise<ApiResponse> {
  const response = await fetch('/api/data');
  return response.json();
}
```

### Type-Safe Redux
```typescript
interface AppState {
  loading: boolean;
  data: DataType[];
  error: string | null;
}

const initialState: AppState = {
  loading: false,
  data: [],
  error: null
};
```

### Type-Safe Forms
```typescript
interface FormValues {
  email: string;
  password: string;
  rememberMe: boolean;
}

const handleSubmit = (values: FormValues) => {
  // Type-safe form handling
};
```

## Troubleshooting
### Common Issues
1. TypeScript not recognizing Rails assets:
   - Ensure `app/javascript` is included in `tsconfig.json`
   - Add type definitions for Rails helpers

2. Type errors in JSX:
   - Verify React type definitions are installed
   - Check `tsconfig.json` JSX settings

3. Missing type definitions:
   - Install appropriate `@types` packages
   - Create custom type definitions in `types` directory
