Rails.application.routes.draw do

  root "application#welcome"
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  resources :teams, except: :show
  resources :teams, only: :show do
    resources :player_teams, only: [:new, :index, :show]
  end
  resources :players
  resources :users, only: :show, path: :profile do
    resources :teams, except: :patch
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
