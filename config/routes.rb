# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pages, only: [:index, :show]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'

  namespace :admin do
    resources :pages, except: [:show]
    resources :sites, except: [:show]
    resources :sections

    post "/nested_fields/:model(/:id)/build/:association(/:partial)", to: "nested_fields#build", as: :build_fields
  end
end
