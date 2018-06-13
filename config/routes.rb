Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'home#index'
  
  namespace :backoffice do
    resources :blog_dashboard, only:[:index]
  end
  
end
