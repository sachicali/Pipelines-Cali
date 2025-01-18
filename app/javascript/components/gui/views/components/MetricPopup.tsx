import React from 'react';

interface Position {
  x: number;
  y: number;
}

interface Metric {
  name: string;
  trend: number;
}

interface MetricPopupProps {
  position: Position;
  metric: Metric;
}

const MetricPopup: React.FC<MetricPopupProps> = ({ position, metric }) => {
  const getAnalysis = () => {
    if (metric.trend >= 0) {
      return (
        <div className="space-y-2">
          <p className="text-sm text-purple-300/70">
            Your {metric.name} is performing well!
          </p>
          <p className="text-sm text-purple-300/70">
            Keep up the great work!
          </p>
        </div>
      );
    } else {
      return (
        <div className="space-y-2">
          <p className="text-sm text-purple-300/70">
            Your {metric.name} is trending down.
          </p>
          <p className="text-sm text-purple-300/70">
            Consider reviewing your content strategy.
          </p>
        </div>
      );
    }
  };

  return (
    <div
      className="absolute z-50 p-4 bg-gray-800 border border-purple-900/50 rounded-lg shadow-lg"
      style={{
        left: position.x + 20,
        top: position.y + 20,
        minWidth: '300px'
      }}
    >
      <h3 className="text-lg font-semibold mb-2">{metric.name} Analysis</h3>
      {getAnalysis()}
    </div>
  );
};

export default MetricPopup;
