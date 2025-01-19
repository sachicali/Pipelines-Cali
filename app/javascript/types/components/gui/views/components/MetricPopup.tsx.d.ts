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

declare const MetricPopup: React.FC<MetricPopupProps>;

export default MetricPopup;