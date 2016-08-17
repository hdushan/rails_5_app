Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :health_checks
  resources :environments
  resources :promos do
    collection do
      get :fetch
    end
  end
  resources :credit_cards do
    collection do
      get :fetch
    end
  end
  resources :direct_debits do
    collection do
      get :fetch
    end
  end
  resources :paypal_accounts do
    collection do
      get :fetch
    end
  end
  resources :vouchers do
    collection do
      get :fetch
    end
  end
  resources :sims do
    collection do
      get :fetch
    end
  end
end
