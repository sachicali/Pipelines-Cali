import React from 'react';
import Chart from './Chart';

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

const MetricsDisplay: React.FC<MetricsDisplayProps> = ({
  metrics,
  isLoading = false,
  selectedMetric,
  onMetricSelect,
  onClose
}) => {
  if (isLoading) {
    return (
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        {[1, 2, 3].map((i) => (
          <div
            key={i}
            className="bg-white dark:bg-gray-800 p-4 rounded border border-gray-100 dark:border-gray-700 animate-pulse"
          >
            <div className="h-8 bg-gray-200 dark:bg-gray-700 rounded w-24 mb-2" />
            <div className="h-4 bg-gray-100 dark:bg-gray-800 rounded w-32" />
          </div>
        ))}
      </div>
    );
  }

  if (!metrics?.length) {
    return (
      <div className="text-gray-500 text-center py-4">
        No metrics available
      </div>
    );
  }

  const chartData = selectedMetric?.chartData ? {
    labels: selectedMetric.chartData.map(d => d.day),
    datasets: [{
      label: selectedMetric.name,
      data: selectedMetric.chartData.map(d => d.value),
      borderColor: '#7C3AED',
      backgroundColor: 'rgba(124, 58, 237, 0.1)',
      tension: 0.1
    }]
  } : null;

  return (
    <div className="relative">
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        {metrics.map((metric) => (
          <button
            key={metric.id}
            onClick={() => onMetricSelect?.(metric)}
            className="bg-white dark:bg-gray-800 p-4 rounded border border-gray-100 dark:border-gray-700 hover:shadow-lg transition-shadow text-left"
            aria-label={`View details for ${metric.name}`}
          >
            <div className="text-2xl font-bold text-gray-900 dark:text-white">
              {metric.value}
            </div>
            <div className="text-sm text-gray-600 dark:text-gray-300">
              {metric.name}
            </div>
            {metric.description && (
              <div className="text-xs text-gray-400 mt-1">
                {metric.description}
              </div>
            )}
          </button>
        ))}
      </div>

      {selectedMetric && (
        <div
          className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4"
          onClick={onClose}
        >
          <div
            className="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-lg max-w-2xl w-full"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="flex justify-between items-center mb-4">
              <h3 className="text-xl font-semibold">
                {selectedMetric.name} Analysis
              </h3>
              <button
                onClick={onClose}
                className="text-gray-500 hover:text-gray-700 dark:hover:text-gray-300"
                aria-label="Close"
              >
                &times;
              </button>
            </div>

            {selectedMetric.trend !== undefined && (
              <div className="space-y-2 mb-4">
                <p className="text-sm text-gray-600 dark:text-gray-300">
                  {selectedMetric.trend >= 0
                    ? `Your ${selectedMetric.name} is performing well!`
                    : `Your ${selectedMetric.name} is trending down.`}
                </p>
                <p className="text-sm text-gray-600 dark:text-gray-300">
                  {selectedMetric.trend >= 0
                    ? 'Keep up the great work!'
                    : 'Consider reviewing your content strategy.'}
                </p>
              </div>
            )}

            {chartData && (
              <div className="mt-4" style={{ height: '300px' }}>
                {(() => {
                  try {
                    return (
                      <Chart
                        type="line"
                        data={chartData}
                        options={{
                          responsive: true,
                          plugins: {
                            legend: {
                              display: false
                            }
                          },
                          scales: {
                            y: {
                              beginAtZero: true,
                              grid: {
                                color: '#E5E7EB'
                              }
                            },
                            x: {
                              grid: {
                                color: '#E5E7EB'
                              }
                            }
                          }
                        }}
                      />
                    );
                  } catch (error) {
                    console.error('Failed to render metrics display chart:', error);
                    return <div className="text-red-500">Failed to render metrics display chart.</div>;
                  }
                })()}
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  );
};

export default MetricsDisplay;
