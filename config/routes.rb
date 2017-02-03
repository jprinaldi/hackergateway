Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :solutions, only: :index
    collection do
      get 'rankings'
    end
  end
  resources :challenges do
    resources :solutions, only: [:index, :create]
  end
  resources :solutions, only: :index
  resources :categories
  root to: 'home#index'
  get 'policies', to: 'policies#index'
  get 'policies/privacy'
  get 'policies/terms'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
