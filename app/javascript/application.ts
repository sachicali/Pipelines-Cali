// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import React from 'react'
import { createRoot } from 'react-dom/client'

type MountReactComponentProps = Record<string, unknown>

// Create a generic function to mount React components
const mountReactComponent = (
  component: React.ComponentType<any>,
  props: MountReactComponentProps = {},
  targetId: string
): (() => void) | null => {
  const targetElement = document.getElementById(targetId)
  if (!targetElement) {
    console.error(`Target element with id ${targetId} not found`)
    return null
  }

  try {
    const root = createRoot(targetElement)
    root.render(React.createElement(component, props))
    return () => {
      try {
        root.unmount()
      } catch (error) {
        console.error('Failed to unmount React component:', error)
      }
    }
  } catch (error) {
    console.error('Failed to mount React component:', error)
    targetElement.innerHTML = `<div class="text-red-500">Component failed to load</div>`
    return null
  }
}

// Create a registry of available components
const componentRegistry: Record<string, React.ComponentType<any>> = {}

// Register a component in the registry
const registerComponent = (name: string, component: React.ComponentType<any>) => {
  componentRegistry[name] = component
}

// Extend window interface for global functions
declare global {
  interface Window {
    mountReactComponent: (componentName: string, props: Record<string, unknown>, targetId: string) => void
    registerComponent: typeof registerComponent
  }
}

// Expose functions to window
window.mountReactComponent = (componentName, props, targetId) => {
  const component = componentRegistry[componentName]
  if (!component) {
    console.error(`Component ${componentName} not found in registry`)
    return
  }
  return mountReactComponent(component, props, targetId)
}

window.registerComponent = registerComponent

// Initialize components when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
  const reactElements = document.querySelectorAll('[data-react-component]')
  
  reactElements.forEach(element => {
    const componentName = element.getAttribute('data-react-component')
    if (!componentName) return
    
    try {
      const props = JSON.parse(element.getAttribute('data-props') || '{}')
      const cleanup = window.mountReactComponent(componentName, props, element.id)
      
      // Store cleanup function for potential unmounting
      if (typeof cleanup === 'function') {
        (element as any).__reactCleanup = cleanup
      }
    } catch (error) {
      console.error(`Failed to initialize component ${componentName}:`, error)
      element.innerHTML = `<div class="text-red-500">Component ${componentName} failed to initialize</div>`
    }
  })
})

// Cleanup on turbo before-cache event
document.addEventListener('turbo:before-cache', () => {
  const reactElements = document.querySelectorAll('[data-react-component]')
  reactElements.forEach(element => {
    const cleanup = (element as any).__reactCleanup
    if (typeof cleanup === 'function') {
      cleanup()
    }
  })
})

// Cleanup on turbo before-cache event
document.addEventListener('turbo:before-cache', () => {
  const reactElements = document.querySelectorAll('[data-react-component]')
  reactElements.forEach(element => {
    if ((element as any).__reactCleanup) {
      (element as any).__reactCleanup()
    }
  })
})
