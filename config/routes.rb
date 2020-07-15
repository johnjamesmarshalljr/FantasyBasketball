Rails.application.routes.draw do

  root "application#welcome"
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  resources :teams
  resources :players
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
