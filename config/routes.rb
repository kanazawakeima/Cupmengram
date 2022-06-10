Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :foods do
    resources :reviews, only: [:index, :create]
    collection do
      get 'search'
    end
  end
  resources :users
  root 'foods#index'
end
