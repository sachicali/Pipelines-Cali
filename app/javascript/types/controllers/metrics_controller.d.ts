import { Controller } from "@hotwired/stimulus";

interface MetricsElement extends HTMLElement {
  classList: DOMTokenList;
}

export default class extends Controller {
  static targets: string[];
  static classes: string[];
  readonly metricTargets: HTMLElement[];
  readonly loadingClass: string;
  readonly errorClass: string;
  connect(): void;
  setLoading(isLoading: boolean): void;
  handleError(): void;
}