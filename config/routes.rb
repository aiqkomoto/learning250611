Rails.application.routes.draw do
  resources :musics
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  root to: "hello#index"
  get "about", to: "hello#about"
  get "counter", to: "counter#index"
  get "roshambo", to: "roshambo#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
    end
  end

  resources :musics do
    resource :like, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
