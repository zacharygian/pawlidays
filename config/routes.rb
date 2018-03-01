Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
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
  get '/profile', to: 'pages#profile'

  as :user do
    get 'login', to: 'pets#index'
  end

end
