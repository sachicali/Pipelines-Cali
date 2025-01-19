import React from 'react';

interface Metric {
  id: string;
  name: string;
  value: string | number;
  description?: string;
  trend?: number;
  chartData?: Array<{ day: string; value: number }>;
}

interface MetricsDisplayProps {
  metrics: Metric[];
  isLoading?: boolean;
  selectedMetric?: Metric | null;
  onMetricSelect?: (metric: Metric) => void;
  onClose?: () => void;
}

declare const MetricsDisplay: React.FC<MetricsDisplayProps>;

export default MetricsDisplay;