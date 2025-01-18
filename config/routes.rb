Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :channels, only: [] do
        post :analyze, on: :collection
        get :status, on: :member
        get :results, on: :member
      end
    end
  end
  
  # Sidekiq Web UI
  if Rails.env.development?
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
  end
  
  # Root route to the React frontend
  root 'application#index'
  
  # React dashboard view
  get '/dashboard/react', to: 'dashboard#react'
end 