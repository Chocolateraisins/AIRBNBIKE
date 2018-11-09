Rails.application.routes.draw do

  get 'bookings/new'
  get 'bookings/show'
  get 'bookings/edit'
  devise_for :users
  root to: 'pages#home'

  resources :bikes do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, except: [:new, :create]

end

