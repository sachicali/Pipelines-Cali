import React from 'react'

interface Metric {
  id: string
  title: string
  value: string
  description?: string
}

interface MetricsDisplayProps {
  metrics: Metric[]
}

const MetricsDisplay: React.FC<MetricsDisplayProps> = ({ metrics }) => {
  if (!metrics?.length) {
    return (
      <div className="text-gray-500 text-center py-4">
        No metrics available
      </div>
    )
  }

  return (
    <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
      {metrics.map(metric => (
        <div 
          key={metric.id}
          className="bg-white dark:bg-gray-800 p-4 rounded"
        >
          <div className="text-2xl font-bold text-gray-900 dark:text-white">
            {metric.value}
          </div>
          <div className="text-sm text-gray-600 dark:text-gray-300">
            {metric.title}
          </div>
          {metric.description && (
            <div className="text-xs text-gray-400 mt-1">
              {metric.description}
            </div>
          )}
        </div>
      ))}
    </div>
  )
}

export default MetricsDisplay