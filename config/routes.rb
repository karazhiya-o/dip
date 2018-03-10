Rails.application.routes.draw do
  get 'orders/new'

  get 'comments/new'

  get 'products/show'

  get 'userparams/new'

  get 'userparams/edit'



  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#show'


  

  devise_scope :user do
  get 'sign_in', to: 'devise/sessions#new'
  get 'sign_up', to: 'devise/registrations#new'
  get 'sign_out', to: 'devise/sessions#destroy'
	end


  get  'show', to: 'home#index'
  get  'profile', to: 'userparams#profile'
   get  'show_comments', to: 'comments#show'
     get 'buy_product', to: 'orders#new'
  put  'product_comment', to: 'comments#destroy'

  get    resources :userparams


  resources :products do
  resources :comments
  end


  resources :orders do
    member do
      put :pay
      put :delete
    end
  end
  devise_for :users

  	
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
