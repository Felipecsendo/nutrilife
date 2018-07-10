Rails.application.routes.draw do
  devise_for :admins, :skip => [:registrations]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'home#index'
  get 'backoffice', to: 'backoffice/blog_dashboard#index'
  
  namespace :backoffice do
    resources :blog_dashboard, only:[:index]
    resources :posts, only:[:index, :new, :create, :edit, :update, :destroy]
    resources :categories, only:[:index, :new, :create, :edit, :update, :destroy]
    resources :admins, only:[:index, :new, :create, :edit, :update, :destroy]
  end
  
  
  
end
