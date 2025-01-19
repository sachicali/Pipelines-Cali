module ApiAccessible
  extend ActiveSupport::Concern

  included do
    # Add class-level API configuration
    class_attribute :api_base_url
    class_attribute :api_timeout
    self.api_timeout = 10 # seconds
  end

  def fetch_from_api(endpoint, params = {})
    url = "#{self.class.api_base_url}/#{endpoint}"
    
    begin
      response = RestClient::Request.execute(
        method: :get,
        url: url,
        headers: { params: params },
        timeout: self.class.api_timeout
      )
      
      JSON.parse(response.body)
    rescue RestClient::Exception => e
      Rails.logger.error "API request failed: #{e.message}"
      raise ApiError, "API request failed: #{e.message}"
    end
  end

  def post_to_api(endpoint, payload = {})
    url = "#{self.class.api_base_url}/#{endpoint}"
    
    begin
      response = RestClient::Request.execute(
        method: :post,
        url: url,
        payload: payload.to_json,
        headers: { content_type: :json },
        timeout: self.class.api_timeout
      )
      
      JSON.parse(response.body)
    rescue RestClient::Exception => e
      Rails.logger.error "API request failed: #{e.message}"
      raise ApiError, "API request failed: #{e.message}"
    end
  end

  class ApiError < StandardError; end
end