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
  const [metrics, setMetrics] = useState<Metric[]>([]);
  const [error, setError] = useState<string | null>(null);

  const fetchDashboardData = async () => {
    try {
      const response = await fetch('/api/v1/channels/UC_test_channel/dashboard');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      
      const metricsData = data.metrics.map((metric: any) => ({
        name: metric.name,
        value: metric.value,
        trend: metric.trend,
        chartData: metric.chartData
      }))
      setMetrics(metricsData);
      setError(null);
    } catch (error) {
      console.error('Failed to fetch dashboard data:', error);
      setError('Failed to load dashboard data. Please try again later.');
    }
  };

  if (error) {
    return (
      <div className="p-6">
        <h1 className="text-2xl font-bold mb-6">Dashboard</h1>
        <div className="text-red-500">{error}</div>
      </div>
    );
  }

  React.useEffect(() => {
    fetchDashboardData();
  }, []);

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
