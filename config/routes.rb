Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  get :dob, to: "home#dob"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

end
