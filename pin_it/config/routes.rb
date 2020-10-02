Rails.application.routes.draw do

  root to: 'home#index'

  get 'pins/:id/edit', to: 'pins#edit', as: 'edit_pin'

  patch 'pins/:id/update', to: 'pins#update', as: 'pin'

  get 'pins/index'

  get 'pins/new'

  get 'pins/show'

  post 'pins/create'

  get 'account/pins'

  get 'application/about'
  
  get 'home/index'

  get 'user/new'

  get 'user/log_in'

  get 'user/register'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
