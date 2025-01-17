import React from 'react';
import PropTypes from 'prop-types';

const MetricsCard = ({ title, value, description }) => {
  return (
    <article 
      className="bg-white dark:bg-gray-800 p-4 rounded border border-gray-100 dark:border-gray-700 transition-colors duration-200"
      role="region"
      aria-label={`${title} metric`}
    >
      <div className="flex flex-col">
        <dt className="order-2 mt-2">
          <h3 className="text-sm font-medium text-gray-500 dark:text-gray-400">
            {title}
          </h3>
          {description && (
            <p className="mt-1 text-xs text-gray-400 dark:text-gray-500">
              {description}
            </p>
          )}
        </dt>
        <dd className="order-1 text-3xl font-bold text-gray-900 dark:text-white">
          {value}
        </dd>
      </div>
    </article>
  );
};

MetricsCard.propTypes = {
  title: PropTypes.string.isRequired,
  value: PropTypes.oneOfType([
    PropTypes.string,
    PropTypes.number
  ]).isRequired,
  description: PropTypes.string
};

export default MetricsCard;