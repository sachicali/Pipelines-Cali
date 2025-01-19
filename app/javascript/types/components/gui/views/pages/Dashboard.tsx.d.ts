import React from 'react';

interface CardProps {
  children: React.ReactNode;
  className?: string;
}

interface CardHeaderProps {
  children: React.ReactNode;
  className?: string;
}

interface CardTitleProps {
  children: React.ReactNode;
  className?: string;
}

interface CardContentProps {
  children: React.ReactNode;
  className?: string;
}

interface ChartDataPoint {
  day: string;
  value: number;
}

interface Metric {
  name: string;
  value: string;
  trend: number;
  chartData: ChartDataPoint[];
}

interface Position {
  x: number;
  y: number;
}

declare const Dashboard: React.FC;

export default Dashboard;