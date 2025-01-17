// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import React from 'react'
import { createRoot } from 'react-dom/client'
import MetricsCard from './components/MetricsCard'

// Create a function to mount React components
const mountReactComponent = (component, props = {}, targetId) => {
  const targetElement = document.getElementById(targetId)
  if (targetElement) {
    const root = createRoot(targetElement)
    const Component = component
    root.render(<Component {...props} />)
  }
}

// Register components for use in Rails views
window.mountMetricsCard = (props, targetId) => {
  mountReactComponent(MetricsCard, props, targetId)
}

// Initialize components when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
  const metricsElements = document.querySelectorAll('[data-react-component="metrics-card"]')
  metricsElements.forEach(element => {
    const props = JSON.parse(element.getAttribute('data-props'))
    mountReactComponent(MetricsCard, props, element.id)
  })
})
