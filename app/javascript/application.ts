// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import React from 'react'
import { createRoot } from 'react-dom/client'
import MetricsCard, { MetricsCardProps } from './components/gui/views/components/MetricsCard.tsx'

type MountReactComponentProps = Partial<MetricsCardProps> & Record<string, unknown>

// Create a function to mount React components
const mountReactComponent = (
  component: React.ComponentType<MountReactComponentProps>,
  props: MountReactComponentProps = {},
  targetId: string
) => {
  const targetElement = document.getElementById(targetId)
  if (targetElement) {
    const root = createRoot(targetElement)
    root.render(React.createElement(component, props))
  }
}

// Extend window interface for global functions
declare global {
  interface Window {
    mountMetricsCard: (props: Record<string, unknown>, targetId: string) => void
  }
}

// Register components for use in Rails views
window.mountMetricsCard = (props, targetId) => {
    mountReactComponent(MetricsCard, props as MountReactComponentProps, targetId)
}

// Initialize components when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
  const metricsElements = document.querySelectorAll('[data-react-component="metrics-card"]')
  metricsElements.forEach(element => {
    const props = JSON.parse(element.getAttribute('data-props') || '{}')
    mountReactComponent(MetricsCard, props, element.id)
  })
})
