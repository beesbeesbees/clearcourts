Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  get :begin, to: "home#begin"
  get :last_citation, to: "home#last_citation"
  get :dob, to: "home#dob"
  get :citations, to: "home#citations"
  get :single_citation, to: "home#single_citation"


  get :sessions, to: "home#sessions"


  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

end
