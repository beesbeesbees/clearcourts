Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", invitations: "admin/invitations" }

  get :begin, to: "home#begin"
  get :last_citation, to: "home#last_citation"
  get :dob, to: "home#dob"
  get :citations, to: "home#citations"
  get :single_citation, to: "home#single_citation"
  get :pay, to: "home#pay"
  get :court, to: "home#court"

  get :sessions, to: "home#sessions"

  post :sms, to: 'twilio#sms'

  namespace :admin do
    resources :users
    resources :citations do
      resources :violations
    end

    resources :courts
  end

  resources :sessions
  resources :citations, only: [:show, :index]

  authenticated :user, ->(user) {user.admin?} do
    root to: "admin/home#index", as: :admin_root
  end
  require 'sidekiq/web'
  mount Sidekiq::Web => '/admin/sidekiq'

  authenticated :user do
    root to: "home#landing", as: :user_root
  end
  root 'home#index' #non-users


end
