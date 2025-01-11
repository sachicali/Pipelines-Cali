import { Controller } from "@hotwired/stimulus"
import Chart from "chart.js/auto"

export default class extends Controller {
  static targets = ["canvas"]

  connect() {
    this.renderChart()
  }

  renderChart() {
    const ctx = this.canvasTarget.getContext("2d")
    new Chart(ctx, {
      type: "line",
      data: this.chartData,
      options: this.chartOptions
    })
  }

  get chartData() {
    return JSON.parse(this.element.dataset.chartData)
  }

  get chartOptions() {
    return {
      responsive: true,
      maintainAspectRatio: false
    }
  }
} 