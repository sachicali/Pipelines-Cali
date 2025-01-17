// Metrics Controller
// Handles real-time updates and state management for metrics component
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["metric"]
  static values = {
    refreshInterval: { type: Number, default: 30000 }, // 30 seconds
    loading: Boolean
  }

  connect() {
    // Initialize refresh timer
    this.startRefreshTimer()
    
    // Setup error handler
    this.handleErrors = this.handleErrors.bind(this)
  }

  disconnect() {
    this.stopRefreshTimer()
  }

  startRefreshTimer() {
    this.refreshTimer = setInterval(() => {
      this.refreshMetrics()
    }, this.refreshIntervalValue)
  }

  stopRefreshTimer() {
    if (this.refreshTimer) {
      clearInterval(this.refreshTimer)
    }
  }

  async refreshMetrics() {
    try {
      this.loadingValue = true
      
      // Request update through Turbo
      await Turbo.visit(window.location.href, { 
        action: "replace",
        frame: this.element
      })
      
      this.loadingValue = false
    } catch (error) {
      this.handleErrors(error)
    }
  }

  handleErrors(error) {
    this.loadingValue = false
    console.error("Error refreshing metrics:", error)
    
    // Add error state to metrics
    this.element.classList.add("metrics-error")
    
    // Retry after delay
    setTimeout(() => {
      this.refreshMetrics()
    }, 5000) // 5 second retry delay
  }

  // Loading state handler
  loadingValueChanged() {
    if (this.loadingValue) {
      this.element.classList.add("metrics-loading")
    } else {
      this.element.classList.remove("metrics-loading")
    }
  }
}