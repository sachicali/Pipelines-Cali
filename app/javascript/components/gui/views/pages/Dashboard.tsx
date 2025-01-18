import React, { useState } from 'react';
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

const Card: React.FC<CardProps> = ({ children, className = '' }) => (
  <div className={`bg-gray-800 rounded-lg shadow ${className}`}>
    {children}
  </div>
);

const CardHeader: React.FC<CardHeaderProps> = ({ children, className = '' }) => (
  <div className={`p-4 border-b border-purple-900/50 ${className}`}>
    {children}
  </div>
);

const CardTitle: React.FC<CardTitleProps> = ({ children, className = '' }) => (
  <h2 className={`text-lg font-semibold ${className}`}>
    {children}
  </h2>
);

const CardContent: React.FC<CardContentProps> = ({ children, className = '' }) => (
  <div className={`p-4 ${className}`}>
    {children}
  </div>
);
import Metrics from '../components/Metrics';
import MetricPopup from '../components/MetricPopup';

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

const Dashboard: React.FC = () => {
  const [hoveredMetric, setHoveredMetric] = useState<Metric | null>(null);
  const [mousePosition, setMousePosition] = useState<Position>({ x: 0, y: 0 });

  const metrics: Metric[] = [
    {
      name: 'Subscribers',
      value: '1.2M',
      trend: 0.12,
      chartData: [
        { day: 'Mon', value: 1200 },
        { day: 'Tue', value: 1500 },
        { day: 'Wed', value: 1800 },
        { day: 'Thu', value: 2000 },
        { day: 'Fri', value: 2200 },
        { day: 'Sat', value: 2500 },
        { day: 'Sun', value: 3000 }
      ]
    },
    {
      name: 'Views',
      value: '15.8M',
      trend: -0.05,
      chartData: [
        { day: 'Mon', value: 10000 },
        { day: 'Tue', value: 12000 },
        { day: 'Wed', value: 11000 },
        { day: 'Thu', value: 9000 },
        { day: 'Fri', value: 8000 },
        { day: 'Sat', value: 7000 },
        { day: 'Sun', value: 6000 }
      ]
    },
    {
      name: 'Watch Time',
      value: '1.8M hours',
      trend: 0.08,
      chartData: [
        { day: 'Mon', value: 100000 },
        { day: 'Tue', value: 120000 },
        { day: 'Wed', value: 130000 },
        { day: 'Thu', value: 140000 },
        { day: 'Fri', value: 150000 },
        { day: 'Sat', value: 160000 },
        { day: 'Sun', value: 170000 }
      ]
    },
    {
      name: 'Engagement',
      value: '8.5%',
      trend: -0.02,
      chartData: [
        { day: 'Mon', value: 7 },
        { day: 'Tue', value: 8 },
        { day: 'Wed', value: 9 },
        { day: 'Thu', value: 7 },
        { day: 'Fri', value: 6 },
        { day: 'Sat', value: 5 },
        { day: 'Sun', value: 4 }
      ]
    }
  ];

  const handleMouseEnter = (metric: Metric, e: React.MouseEvent) => {
    setHoveredMetric(metric);
    setMousePosition({ x: e.clientX, y: e.clientY });
  };

  const handleMouseLeave = () => {
    setHoveredMetric(null);
  };

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-6">Dashboard</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        {metrics.map((metric, index) => (
          <div
            key={index}
            onMouseMove={(e) => handleMouseEnter(metric, e)}
            onMouseLeave={handleMouseLeave}
            className="relative"
          >
            <Card>
              <CardHeader>
                <CardTitle>{metric.name}</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="text-3xl font-bold">{metric.value}</div>
                <div className={`text-sm mt-2 ${
                  metric.trend >= 0 ? 'text-emerald-500' : 'text-red-500'
                }`}>
                  {metric.trend >= 0 ? '▲' : '▼'} {Math.abs(metric.trend * 100).toFixed(1)}%
                </div>
              </CardContent>
            </Card>
            
            {hoveredMetric === metric && (
              <MetricPopup position={mousePosition} metric={metric} />
            )}
          </div>
        ))}
      </div>
      
      <div className="mt-8 space-y-8">
        {metrics.map((metric, index) => (
          <Metrics key={index} metric={metric} />
        ))}
      </div>
    </div>
  );
};

export default Dashboard;
