Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'pets#index', as: :authenticated_root
  end
  root to: 'pages#home'

  resources :pets do
    resources :bookings, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'bookings#dashboard'
  get '/owner', to: 'pets#dashboard'
end
