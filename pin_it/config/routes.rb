Rails.application.routes.draw do
  get 'home/home'

  get 'user/new'

  get 'user/log_in'

  get 'user/register'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
