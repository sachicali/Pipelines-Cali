module Pipeline
  class Error < StandardError; end
  class ConfigurationError < Error; end
  class APIError < Error; end
  class AnalysisError < Error; end
  class StorageError < Error; end
  class ValidationError < Error; end
end 