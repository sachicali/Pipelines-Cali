import { Controller } from "@hotwired/stimulus";
import { ChartConfiguration, ChartData } from "chart.js/auto";

interface ChartElement extends HTMLElement {
  dataset: {
    chartData: string;
  };
}

export default class extends Controller {
  static targets: string[];
  readonly canvasTarget: HTMLCanvasElement;
  connect(): void;
  renderChart(): void;
  get chartData(): ChartData;
  get chartOptions(): ChartConfiguration["options"];
}