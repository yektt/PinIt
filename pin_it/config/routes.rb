Rails.application.routes.draw do

  root to: 'home#index'

  resources :users
  
  resources :pins do
   resources :comments
  end

  get 'account/pins'

  get 'application/about'
  
  get 'home/index'

  get 'users/log_in'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
