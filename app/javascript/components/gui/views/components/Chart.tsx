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
    let chart: ChartInstance;
    try {
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
          chart = new ChartJS(ctx, {
            type,
            data,
            options: chartOptions,
          });
          chartInstance.current = chart;
        }
      }
    } catch (error) {
      console.error('Failed to render chart:', error);
      return () => <div className="text-red-500">Failed to render chart.</div>;
    }

    return () => {
      if (chartInstance.current) {
        try {
          chartInstance.current.destroy();
        } catch (error) {
          console.error('Failed to destroy chart:', error);
        }
      }
    };
  }, [type, data, options]);

  return <canvas ref={chartRef} />;
};

export default Chart;
