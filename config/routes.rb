# frozen_string_literal: true

Rails.application.routes.draw do
  mount_roboto
  mount Lockup::Engine, at: "/lockup"
  authenticate :user, ->(user) { user.has_role? :admin } do
    mount PgHero::Engine, at: "pghero"
  end
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users, controllers: { registrations: :registrations }
  resources :users, only: %i[index show] do
    resources :solutions, only: :index
  end
  resources :challenges, only: %i[index show] do
    resources :solutions, only: %i[index create]
  end
  resources :solutions, only: :index
  resources :categories, only: %i[index show]
  resources :faqs, only: :index
  root to: "home#index"
  get "leaderboard", to: "leaderboard#index"
  get "policies", to: "policies#index"
  get "policies/privacy"
  get "policies/terms"
  get "faq", to: "faq#index"
  get "about", to: "about#index"
  get "chat", to: "chat#index"

  namespace :api do
    namespace :wechall do
      namespace :users do
        get "validate"
        get "score"
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
