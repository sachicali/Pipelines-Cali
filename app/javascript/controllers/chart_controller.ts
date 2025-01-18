import { Controller } from "@hotwired/stimulus"
import Chart, { ChartConfiguration, ChartData } from "chart.js/auto"

interface ChartElement extends HTMLElement {
  dataset: {
    chartData: string
  }
}

export default class extends Controller {
  static targets = ["canvas"]
  declare readonly canvasTarget: HTMLCanvasElement

  connect(): void {
    this.renderChart()
  }

  renderChart(): void {
    const ctx = this.canvasTarget.getContext("2d")
    if (!ctx) {
      console.error("Could not get 2d context from canvas element")
      return
    }

    const config: ChartConfiguration = {
      type: "line",
      data: this.chartData,
      options: this.chartOptions
    }

    new Chart(ctx, config)
  }

  get chartData(): ChartData {
    try {
      return JSON.parse((this.element as ChartElement).dataset.chartData)
    } catch (error) {
      console.error("Failed to parse chart data:", error)
      return { datasets: [] }
    }
  }

  get chartOptions(): ChartConfiguration["options"] {
    return {
      responsive: true,
      maintainAspectRatio: false
    }
  }
}
