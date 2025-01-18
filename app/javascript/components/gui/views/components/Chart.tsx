import React, { useEffect, useRef } from 'react';
import { Chart as ChartJS, ChartData, ChartOptions } from 'chart.js';

type ChartInstance = ChartJS | undefined;

interface ChartProps {
  type: 'line' | 'bar';
  data: ChartData;
  options?: ChartOptions;
}

const Chart: React.FC<ChartProps> = ({ type, data, options }) => {
  const chartRef = useRef<HTMLCanvasElement | null>(null);
  const chartInstance = useRef<ChartInstance>(undefined);

  useEffect(() => {
    if (chartRef.current) {
      const ctx = chartRef.current.getContext('2d');
      if (ctx) {
        const chartOptions: ChartOptions = {
          responsive: true,
          maintainAspectRatio: false,
          plugins: {
            legend: {
              position: 'top',
            },
          },
          ...options,
        };
        chartInstance.current = new ChartJS(ctx, {
          type,
          data,
          options: chartOptions,
        });
      }
    }

    return () => {
      if (chartInstance.current) {
        chartInstance.current.destroy();
      }
    };
  }, [type, data, options]);

  return <canvas ref={chartRef} />;
};

export default Chart;
