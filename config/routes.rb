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


end
