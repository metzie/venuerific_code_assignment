Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Authentication Page
  devise_for :users, skip: %i[confirmation unlock passwords]

  # Front
  root to: 'front/home#index'
  resources :posts, only: %i[index show], controller: 'front/posts'

  # Admin
  devise_scope :user do
    namespace :admin do
      root to: 'dashboard#index'
    end
  end
end
