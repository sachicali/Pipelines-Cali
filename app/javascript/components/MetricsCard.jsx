import React from 'react';
import PropTypes from 'prop-types';

const MetricsCard = ({ title, value, description, isLoading = false }) => {
  if (isLoading) {
    return (
      <article className="bg-white dark:bg-gray-800 p-4 rounded border border-gray-100 dark:border-gray-700">
        <div className="animate-pulse space-y-2">
          <div className="h-8 bg-gray-200 dark:bg-gray-700 rounded w-24" />
          <div className="h-4 bg-gray-100 dark:bg-gray-800 rounded w-32" />
        </div>
      </article>
    );
  }

  if (!value) {
    return (
      <article className="bg-white dark:bg-gray-800 p-4 rounded border border-gray-100 dark:border-gray-700">
        <p className="text-sm text-gray-500">Unable to load metric</p>
      </article>
    );
  }

  return (
    <article 
      className="bg-white dark:bg-gray-800 p-4 rounded border border-gray-100 dark:border-gray-700"
      role="region"
      aria-label={`${title} metric`}
    >
      <div className="flex flex-col">
        <dd className="text-3xl font-bold text-gray-900 dark:text-white">
          {value}
        </dd>
        <dt className="mt-2">
          <h3 className="text-sm font-medium text-gray-500 dark:text-gray-400">
            {title}
          </h3>
          {description && (
            <p className="mt-1 text-xs text-gray-400 dark:text-gray-500">
              {description}
            </p>
          )}
        </dt>
      </div>
    </article>
  );
};

MetricsCard.propTypes = {
  title: PropTypes.string.isRequired,
  value: PropTypes.oneOfType([
    PropTypes.string,
    PropTypes.number
  ]),
  description: PropTypes.string,
  isLoading: PropTypes.bool
};

export default MetricsCard;