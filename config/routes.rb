Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'home#index'
  get 'backoffice', to: 'backoffice/blog_dashboard#index'
  
  namespace :backoffice do
    resources :blog_dashboard, only:[:index]
    resources :blog, only:[:index, :new, :create, :edit, :update, :destroy]
    resources :category, only:[:index, :new, :create]
  end
  
  
  
end
