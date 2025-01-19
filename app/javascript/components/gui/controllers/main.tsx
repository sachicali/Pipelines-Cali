import React from 'react'
    import ReactDOM from 'react-dom/client'
    import App from './App.jsx'

    const rootElement = document.getElementById('root');
    if (!rootElement) throw new Error('Failed to find the root element');
    const root = ReactDOM.createRoot(rootElement);
    try {
      root.render(
        <React.StrictMode>
          <App />
        </React.StrictMode>
      )
    } catch (error) {
      console.error('Failed to render the app:', error);
      // render an error message to the user
    }
