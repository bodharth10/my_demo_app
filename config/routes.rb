Rails.application.routes.draw do
   default_url_options :host => "maropost.dev"
   devise_for :users 
   devise_for :admin_users, ActiveAdmin::Devise.config
   ActiveAdmin.routes(self)
   
   
   root to: 'home#index'

   get 'home/about_us'

   
   resources :contacts, only: [:new, :create]

   resources :photos do
     collection do
       post :import
     end 
   end
   # post 'auth_user' => 'authentication#authenticate_user'
   # namespace :api, defaults: { format: :json } do
   #   namespace :v1 do
   #     resources :users, :only => [:show, :create, :update, :destroy]
   #     resources :photos
   #   end
   # end

   require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
    match '/contacts', to: 'contacts#new', via: 'get'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
