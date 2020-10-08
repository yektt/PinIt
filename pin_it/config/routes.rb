Rails.application.routes.draw do

  root to: 'home#index'
  
  get 'home/index'

  get 'home/about'

  resources :users do
    resources :goals
  end

  resources :pins do
    resources :comments
  end

  get 'account/pins'
end
