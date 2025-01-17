import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types';

const MetricsCard = ({ title, value, description }) => {
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);
  const [displayValue, setDisplayValue] = useState(null);

  useEffect(() => {
    const loadData = async () => {
      try {
        setIsLoading(true);
        // Simulate data loading for smoother transitions
        await new Promise(resolve => setTimeout(resolve, 300));
        setDisplayValue(value);
        setError(null);
      } catch (err) {
        setError('Failed to load metric');
      } finally {
        setIsLoading(false);
      }
    };

    loadData();
  }, [value]);

  const renderContent = () => {
    if (isLoading) {
      return (
        <div className="animate-pulse"></div>