import React from 'react'

interface Metric {
  id: string
  title: string
  value: string | number
  description?: string
  trend?: number
  isLoading?: boolean
}

export interface MetricsCardProps {
  metric?: Metric
  onClick?: () => void
}

const MetricsCard: React.FC<MetricsCardProps> = ({ metric, onClick }) => {
  if (!metric) {
    return (
      <article className="bg-white dark:bg-gray-800 p-4 rounded border border-gray-100 dark:border-gray-700">
        <p className="text-sm text-gray-500">No metric data available</p>
      </article>
    )
  }
  if (metric.isLoading) {
    return (
      <article className="bg-white dark:bg-gray-800 p-4 rounded border border-gray-100 dark:border-gray-700 animate-pulse">
        <div className="space-y-2">
          <div className="h-8 bg-gray-200 dark:bg-gray-700 rounded w-24" />
          <div className="h-4 bg-gray-100 dark:bg-gray-800 rounded w-32" />
        </div>
      </article>
    )
  }

  if (!metric.value) {
    return (
      <article className="bg-white dark:bg-gray-800 p-4 rounded border border-gray-100 dark:border-gray-700">
        <p className="text-sm text-gray-500">Unable to load metric</p>
      </article>
    )
  }

  return (
    <article 
      className={`bg-white dark:bg-gray-800 p-4 rounded border border-gray-100 dark:border-gray-700 ${
        onClick ? 'hover:shadow-lg cursor-pointer transition-shadow' : ''
      }`}
      role={onClick ? 'button' : 'region'}
      aria-label={`${metric.title} metric`}
      onClick={onClick}
    >
      <div className="flex flex-col">
        <dd className="text-3xl font-bold text-gray-900 dark:text-white">
          {metric.value}
          {metric.trend !== undefined && (
            <span
              className={`ml-2 text-sm ${
                metric.trend >= 0
                  ? 'text-emerald-500'
                  : 'text-red-500'
              }`}
            >
              {metric.trend >= 0 ? '▲' : '▼'} {Math.abs(metric.trend)}%
            </span>
          )}
        </dd>
        <dt className="mt-2">
          <h3 className="text-sm font-medium text-gray-500 dark:text-gray-400">
            {metric.title}
          </h3>
          {metric.description && (
            <p className="mt-1 text-xs text-gray-400 dark:text-gray-500">
              {metric.description}
            </p>
          )}
        </dt>
      </div>
    </article>
  )
}

export default MetricsCard
