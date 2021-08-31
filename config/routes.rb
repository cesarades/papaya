Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'profile/:id', to: "pages#profile"
  resources :events, only: %i[index show create update destroy] do
    resources :bookings, only: %i[create update destroy]
  end
end
