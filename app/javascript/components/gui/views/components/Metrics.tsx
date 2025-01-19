import React from 'react';
import { LineChart, Line, XAxis, YAxis, Tooltip, ResponsiveContainer } from 'recharts';

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

const Metrics: React.FC<MetricsProps> = ({ metric }) => {
  return (
    <div
      className="p-4 bg-gray-800 border border-purple-900/50 rounded-lg shadow-lg"
      style={{
        minWidth: '300px'
      }}
    >
      <h3 className="text-lg font-semibold mb-2">{metric.name} Chart</h3>
      <div style={{ width: '100%', height: 100 }}>
        <ResponsiveContainer>
          {(() => {
            try {
              return (
                <LineChart data={metric.chartData}>
                  <XAxis dataKey="day" hide />
                  <YAxis hide />
                  <Tooltip />
                  <Line
                    type="monotone"
                    dataKey="value"
                    stroke={metric.trend >= 0 ? 'hsl(var(--emerald-accent-color))' : '#ef4444'}
                    strokeWidth={2}
                  />
                </LineChart>
              );
            } catch (error) {
              console.error('Failed to render metrics chart:', error);
              return <div className="text-red-500">Failed to render metrics chart.</div>;
            }
          })()}
        </ResponsiveContainer>
      </div>
    </div>
  );
};

export default Metrics;
