# app/lib/error_handler.rb
module ErrorHandler
  def self.included(clazz)
    clazz.rescue_from StandardError do |e|
      Rails.logger.error("Error: #{e.class.name} - #{e.message}\n#{e.backtrace.join("\n")}")
      render json: { error: e.message }, status: :internal_server_error
    end
  end
end