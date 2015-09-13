Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", invitations: "admin/invitations" }

  get :begin, to: "home#begin"
  get :last_citation, to: "home#last_citation"
  get :dob, to: "home#dob"
  get :citations, to: "home#citations"
  get :single_citation, to: "home#single_citation"
  get :volunteer, to: "home#volunteer"

  get :about, to: "home#about"
  get :api, to: "home#api"


  get :sessions, to: "home#sessions"


  post :sms, to: 'twilio#sms'

  namespace :admin do
    resources :users
    resources :citations do
      collection do
        get :csv
        post :import
      end
    end
    resources :courts
  end

  namespace :api do
    resources :courts do
      get :citations
    end

    resources :citations do
      resources :violations
    end

    resources :violations

    get :docs
    get :regenerate_token
  end

  resources :sessions

  get 'name', to: 'sessions#new'
  get 'birthdate', to: 'sessions#update'

  resources :citations, only: [:show, :index] do
    member do
      get :pay
      post :charge
      get :pay_confirmed
    end
  end

  resources :courts

  require 'sidekiq/web'
  mount Sidekiq::Web => '/admin/sidekiq'

  authenticated :user do
    root to: "admin/citations#index", as: :user_root
  end
  root 'home#index' #non-users


end
