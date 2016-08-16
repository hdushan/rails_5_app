Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :health_checks
  resources :environments
  resources :promos
  resources :vouchers
  resources :sims do
    collection do
      get :reserve
    end
  end
end
