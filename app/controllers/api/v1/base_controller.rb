module Api
  module V1
    class BaseController < ApplicationController
      protect_from_forgery with: :null_session
      
      rescue_from StandardError, with: :handle_error
      rescue_from Pipeline::Error, with: :handle_pipeline_error
      
      private
      
      def handle_error(error)
        render json: {
          error: 'Internal Server Error',
          message: error.message
        }, status: :internal_server_error
      end
      
      def handle_pipeline_error(error)
        render json: {
          error: error.class.name.demodulize,
          message: error.message
        }, status: :unprocessable_entity
      end
    end
  end
end 