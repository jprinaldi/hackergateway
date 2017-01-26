Rails.application.routes.draw do
  resources :challenges do
    resources :solutions, only: [:index, :create]
  end
  resources :categories
  devise_for :users
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
