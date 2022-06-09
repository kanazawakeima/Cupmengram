Rails.application.routes.draw do
  resources :foods do
    collection do
      get 'search'
    end
  end
end
