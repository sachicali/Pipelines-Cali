// Metrics Controller
// Handles basic state management and accessibility for metrics component
import { Controller } from "@hotwired/stimulus"

interface MetricsElement extends HTMLElement {
  classList: DOMTokenList
}

export default class extends Controller {
  static targets = ["metric"]
  static classes = ["loading", "error"]
  
  declare readonly metricTargets: HTMLElement[]
  declare readonly loadingClass: string
  declare readonly errorClass: string

  connect(): void {
    // Ensure proper ARIA states
    const element = this.element as MetricsElement
    element.setAttribute("role", "region")
    element.setAttribute("aria-label", "Channel Metrics")
  }

  // Basic loading state handler
  setLoading(isLoading: boolean): void {
    const element = this.element as MetricsElement
    if (isLoading) {
      element.classList.add(this.loadingClass)
      element.setAttribute("aria-busy", "true")
    } else {
      element.classList.remove(this.loadingClass)
      element.setAttribute("aria-busy", "false")
    }
  }

  // Simple error handler
  handleError(): void {
    const element = this.element as MetricsElement
    element.classList.add(this.errorClass)
    element.setAttribute("aria-invalid", "true")
    
    // Add error message for screen readers
    const errorMsg = document.createElement("div")
    errorMsg.setAttribute("role", "alert")
    errorMsg.classList.add("sr-only")
    errorMsg.textContent = "Error loading metrics. Please try again later."
    
    try {
      element.appendChild(errorMsg)
    } catch (error) {
      console.error("Failed to append error message:", error)
    }
  }
}
