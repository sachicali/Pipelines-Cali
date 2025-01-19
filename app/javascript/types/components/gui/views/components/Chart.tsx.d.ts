import { ChartData, ChartOptions } from 'chart.js';
import React from 'react';

interface ChartProps {
  type: 'line' | 'bar';
  data: ChartData;
  options?: ChartOptions;
}

declare const Chart: React.FC<ChartProps>;

export default Chart;