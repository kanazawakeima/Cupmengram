Rails.application.routes.draw do
  root 'homes#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end

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
