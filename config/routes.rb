Rails.application.routes.draw do


  # get 'users/edit'
  # get 'users/update'
  devise_for :users
  root to: 'pages#home'

  resources :bikes do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, except: [:new, :create]

  resources :users, only: [:edit, :update]

end

