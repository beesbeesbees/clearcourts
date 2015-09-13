Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", invitations: "admin/invitations" }


  get 'home/index'
  root 'home#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


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

  authenticated :user, ->(user) {user.admin? || user.court_user?} do
    root to: "admin/users#index", as: :admin_root
  end

  root to: "home#landing", as: :user_root

end
