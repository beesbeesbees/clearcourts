Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }


  get 'home/index'
  root 'home#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


  namespace :admin do
    resources :users
    resources :citations do
      resources :violations
    end

    resources :courts
  end

  authenticated :user, ->(user) {user.admin?} do
    root to: "admin/home#index", as: :admin_root
  end

  authenticated :user do
    root to: "home#landing", as: :user_root
  end

end
