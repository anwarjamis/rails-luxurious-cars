Rails.application.routes.draw do
  devise_for :users
  root to: 'cars#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/cars/reservations', to: 'reservations#index'
  resources :cars do
    resources :reservations, except: :index
  end
  get '/mycars', to: 'cars#my_cars'
  resources :users, except: %i[index destroy]
end
