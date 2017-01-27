Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show do
    resources :solutions, only: :index
  end
  resources :challenges do
    resources :solutions, only: [:index, :create]
  end
  resources :solutions, only: :index
  resources :categories
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
