# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, sign_out_via: %i[get post]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :groups
  resources :groups_purchases
  resources :purchases

  authenticated :user do
    root to: 'groups#index'
  end

  devise_scope :user do
    root to: 'devise/sessions#splash', as: :splash_root
  end

  get '/older_groups' => 'groups#older_index'
  # resource :user
end
