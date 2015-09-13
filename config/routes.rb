Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  get :begin, to: "home#begin"
  get :last_citation, to: "home#last_citation"
  get :dob, to: "home#dob"
  get :citations, to: "home#citations"
  get :single_citation, to: "home#single_citation"

  get :sessions, to: "home#sessions"

  post :sms, to: 'twilio#sms'

  namespace :admin do
    resources :users
    resources :citations do
      resources :violations
    end

    resources :courts
  end

  authenticated :user, ->(user) {user.admin?} do
    root to: "admin/home#index", as: :admin_root
    require 'sidekiq/web'
    mount Sidekiq::Web => '/admin/sidekiq'
  end

  authenticated :user do
    root to: "home#landing", as: :user_root
  end
  root 'home#index' #non-users

end
