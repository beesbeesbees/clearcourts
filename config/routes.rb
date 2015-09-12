Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

end
