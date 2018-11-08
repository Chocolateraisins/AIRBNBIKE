Rails.application.routes.draw do
  get 'bikes/new'
  get 'bikes/edit'
  get 'bikes/show'
  devise_for :users
  root to: 'pages#home'

  resources :users do
    resources :bikes
    resources :bookings
  end

end
