// Metrics Controller
// Handles basic state management and accessibility for metrics component
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["metric"]
  static classes = ["loading", "error"]

  connect() {
    // Ensure proper ARIA states
    this.element.setAttribute("role", "region")
    this.element.setAttribute("aria-label", "Channel Metrics")
  }

  // Basic loading state handler
  setLoading(isLoading) {
    if (isLoading) {
      this.element.classList.add("metrics-loading")
      this.element.setAttribute("aria-busy", "true")
    } else {
      this.element.classList.remove("metrics-loading")
      this.element.setAttribute("aria-busy", "false")
    }
  }

  // Simple error handler
  handleError() {
    this.element.classList.add("metrics-error")
    this.element.setAttribute("aria-invalid", "true")
    
    // Add error message for screen readers
    const errorMsg = document.createElement("div")
    errorMsg.setAttribute("role", "alert")
    errorMsg.classList.add("sr-only")
    errorMsg.textContent = "Error loading metrics. Please try again later."
    this.element.appendChild(errorMsg)
  }
}