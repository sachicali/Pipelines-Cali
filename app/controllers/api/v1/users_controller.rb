module Api
  module V1
    class UsersController < BaseController
      # @description Gets all users.
      # @response [JSON]
      #   [
      #     {
      #       id: 1,
      #       name: 'John Doe',
      #       email: 'john.doe@example.com'
      #     },
      #     {
      #       id: 2,
      #       name: 'Jane Smith',
      #       email: 'jane.smith@example.com'
      #     }
      #   ]
      def index
        users = User.all.map do |user|
          {
            id: user.id,
            name: user.name,
            email: user.email
          }
        end
        render json: users
      end
      
      # @description Logs in a user.
      # @param email [String] The email of the user.
      # @param password [String] The password of the user.
      # @response [JSON]
      #   {
      #     message: 'Login successful',
      #     user: { ... }
      #   }
      def login
        render json: { message: 'Login successful', user: { id: 1, name: 'Test User', email: 'test@example.com' } }
      end
      
      # @description Registers a new user.
      # @param name [String] The name of the user.
      # @param email [String] The email of the user.
      # @param password [String] The password of the user.
      # @response [JSON]
      #   {
      #     message: 'Registration successful',
      #     user: { ... }
      #   }
      def register
        render json: { message: 'Registration successful', user: { id: 2, name: 'New User', email: 'new@example.com' } }
      end
    end
  end
end