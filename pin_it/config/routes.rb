Rails.application.routes.draw do

  get 'application/about'

  root to: 'home#index'
  
  get 'home/index'

  get 'user/new'

  get 'user/log_in'

  get 'user/register'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
