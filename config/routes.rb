Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  delete 'dashboard', to: 'pages#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Routes for listings controller
  resources :listings do
    resources :bookings, except: [:index, :destroy]
  end
  resources :bookings, only: :destroy
  # # As a visitor I can visit the home page ----path:/
  # get '', to: 'listings#top'
  # # As a visitor I can view the list of available vehicles ----path:/listings
  # get '/listings', to: 'listings#index'
  # # As a visitor I can search for a specific RV----path:/listings/:id
  # get '/listings/:id', to: 'listings#show'
  # # As a owner I can list a vehicle for rent ----path:/listings/new
  # get '/listings/new', to: 'listings#new'
  # # As a owner I can create an RV's description ----path:/listings/create
  # # As a owner I can add location and capacity to my RV ----path:/listings/create
  # get '/listings/create', to: 'listings#create'
  # # As a renter I can pick the dates to rent an RV ----path:/listings/:listing_id/booking/new
end
