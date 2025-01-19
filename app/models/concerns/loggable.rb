module Loggable
  extend ActiveSupport::Concern

  included do
    # Add class-level logging configuration
    class_attribute :log_level
    self.log_level = :info
  end

  def log_start(operation, id)
    Rails.logger.send(log_level, "Starting #{operation} for ID: #{id}")
  end

  def log_error(operation, id, error)
    Rails.logger.error "#{operation} failed for ID: #{id}: #{error.message}"
    Rails.logger.error error.backtrace.join("\n")
  end

  def log_success(operation, id, message = nil)
    Rails.logger.send(log_level, "Completed #{operation} for ID: #{id}")
    Rails.logger.send(log_level, message) if message
  end

  def log_debug(message)
    Rails.logger.debug(message)
  end
end