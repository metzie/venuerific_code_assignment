Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, skip: %i[confirmation unlock passwords]

  root to: 'front/home#index'

  devise_scope :user do
    namespace :admin do
      root to: 'dashboard#index'
    end
  end
end
