module MetricsHandling
  extend ActiveSupport::Concern

  included do
    # Add class-level metrics configuration
    class_attribute :metrics_cache_ttl
    self.metrics_cache_ttl = 1.hour
  end

  def fetch_metrics(metric_type, id)
    cached_metrics = fetch_from_cache(metric_type, id)
    return cached_metrics if cached_metrics

    metrics = fetch_metrics_from_service(metric_type, id)
    store_in_cache(metric_type, id, metrics)
    metrics
  end

  def fetch_metrics_from_service(metric_type, id)
    # Implementation to fetch metrics from the metrics service
    # This should be implemented in the specific model
    raise NotImplementedError, "Metrics service implementation required"
  end

  def normalize_metrics(metrics)
    # Convert metrics to a standard format
    metrics.transform_values do |value|
      case value
      when Hash then value.transform_values(&:to_f)
      else value.to_f
      end
    end
  end
end