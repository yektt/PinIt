Rails.application.routes.draw do

  root to: 'home#index'

  get 'pins/edit'

  get 'pins/index'

  get 'pins/new'

  get 'pins/show'

  get 'account/pins'

  get 'application/about'
  
  get 'home/index'

  get 'user/new'

  get 'user/log_in'

  get 'user/register'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
