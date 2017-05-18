Rails.application.routes.draw do
   default_url_options :host => "maropost.dev"
   devise_for :admin_users, ActiveAdmin::Devise.config
   ActiveAdmin.routes(self)
   devise_for :users 
   
   root to: 'home#index'

   get 'home/about_us'

   match '/contacts', to: 'contacts#new', via: 'get'
   resources :contacts, only: [:new, :create]

   resources :photos do
     collection do
       post :import
     end 
   end
   post 'auth_user' => 'authentication#authenticate_user'
   namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, :only => [:show, :create, :update, :destroy]
      resources :photos
    end
   end  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
