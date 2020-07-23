Rails.application.routes.draw do

  root "application#welcome"
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  resources :teams, except: :show
  resources :teams, only: :show do
    resources :player_teams, only: :index
  end
  resources :players, only: :index
  resources :users, only: :show do
    resources :teams, except: :patch
  end

  # post '/users/:id/teams/new', to: 'teams#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
