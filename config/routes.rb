Rails.application.routes.draw do
  get 'sims/index'

  get 'vouchers/index'

  get 'promos/index'

  get 'environments/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :health_checks
  resources :environments
  resources :promos
  resources :vouchers
  resources :sims
end
