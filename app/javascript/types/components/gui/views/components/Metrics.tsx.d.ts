import React from 'react';

interface ChartDataPoint {
  day: string;
  value: number;
}

interface Metric {
  name: string;
  trend: number;
  chartData: ChartDataPoint[];
}

interface MetricsProps {
  metric: Metric;
}

declare const Metrics: React.FC<MetricsProps>;

export default Metrics;