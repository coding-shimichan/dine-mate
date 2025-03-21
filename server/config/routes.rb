Rails.application.routes.draw do
  root to: "restaurants#search"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post "/api/users/sign_in" => "api/sessions#create"
  end

  resources :users, except: [ :index, :new, :create, :edit, :update, :destroy ] do
    resources :wishlists, only: [ :index ], to: "users#wishlists"
    resources :memories, only: [ :index ], to: "users#memories"
  end

  namespace :api do
    resources :memories
    resources :wishlists, only: [ :index, :create, :destroy ]
  end

  namespace :admin do
    resources :users
    resources :restaurants, only: [ :index, :show, :destroy ]
    resources :wishlists, only: [ :index, :destroy ]
    resources :memories, only: [ :index, :show, :destroy ]
    resources :chats, only: [ :index, :destroy ] do
      resources :messages, only: [ :index ]
    end
  end

  resources :chats, except: [ :edit, :update, :new ] do
    # resources :messages, only: [ :index, :create ]
    member do
      get :load_messages
    end
  end

  get "/restaurants/search", to: "restaurants#search"
  resources :restaurants, only: [:show] do
    get :interested_users
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
