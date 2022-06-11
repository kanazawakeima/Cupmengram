Rails.application.routes.draw do
  root 'homes#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users
  resources :foods do
    resources :recipes
    resources :reviews, only: [:index, :create]
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end
