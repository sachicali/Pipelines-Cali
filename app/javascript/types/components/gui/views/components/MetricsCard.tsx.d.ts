import React from 'react';

interface Metric {
  id: string;
  title: string;
  value: string | number;
  description?: string;
  trend?: number;
  isLoading?: boolean;
}

export interface MetricsCardProps {
  metric?: Metric;
  onClick?: () => void;
}

declare const MetricsCard: React.FC<MetricsCardProps>;

export default MetricsCard;