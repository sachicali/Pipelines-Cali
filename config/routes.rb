Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :channels, only: [] do
        post :analyze, on: :collection
        get :status, on: :member
        get :results, on: :member
        get :dashboard, on: :member
        get :competitors, on: :member
        get :notifications, on: :member
        post :import, on: :collection
      end
      
      resources :users, only: [:index] do
        post :login, on: :collection
        post :register, on: :collection
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
  get '/admin/settings', to: 'dashboard#react'
  get '/login', to: 'dashboard#react'
  get '/register', to: 'dashboard#react'
end 