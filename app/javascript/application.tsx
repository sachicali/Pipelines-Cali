// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import React from 'react'
import { createRoot } from 'react-dom/client'
import MetricsCard from './components/gui/views/components/MetricsCard'

interface MountReactComponentProps {
  component: React.ComponentType<any>
  props?: Record<string, unknown>
  targetId: string
}

declare global {
  interface Window {
    mountMetricsCard: (props: Record<string, unknown>, targetId: string) => void
  }
}

// Create a function to mount React components
const mountReactComponent = (
  component: React.ComponentType<any>,
  props: Record<string, unknown> = {},
  targetId: string
): void => {
  const targetElement = document.getElementById(targetId)
  if (targetElement) {
    const root = createRoot(targetElement)
    const Component = component
    root.render(<Component {...props} />)
  }
}

// Register components for use in Rails views
window.mountMetricsCard = (props: Record<string, unknown>, targetId: string): void => {
  mountReactComponent(MetricsCard, props, targetId)
}

// Initialize components when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
  const metricsElements = document.querySelectorAll('[data-react-component="metrics-card"]')
  metricsElements.forEach(element => {
    const props = JSON.parse(element.getAttribute('data-props') || '{}')
    mountReactComponent(MetricsCard, props, element.id)
  })
})
