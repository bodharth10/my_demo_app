Rails.application.routes.draw do
  
   devise_for :admin_users, ActiveAdmin::Devise.config
   ActiveAdmin.routes(self)
   devise_for :users 
   
   root to: 'home#index'

   get 'home/about_us'

   match '/contacts', to: 'contacts#new', via: 'get'
   resources :contacts, only: [:new, :create]
   resources :photos

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
