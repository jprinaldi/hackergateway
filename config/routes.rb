Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :solutions, only: :index
    collection do
      get 'rankings'
    end
  end
  resources :challenges, only: [:index, :show] do
    resources :solutions, only: [:index, :create]
  end
  resources :solutions, only: :index
  resources :categories, only: [:index, :show]
  root to: 'home#index'
  get 'policies', to: 'policies#index'
  get 'policies/privacy'
  get 'policies/terms'
  get 'faq', to: 'faq#index'
  get 'about', to: 'about#index'
  get 'chat', to: 'chat#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
