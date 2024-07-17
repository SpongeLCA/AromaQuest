Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :results, only: [:new, :create, :index, :show]
  resources :perfumes, only: [:index, :show] do
    resources :favorites, only: [:create]
    resources :reviews, only: [:create]
  end

  resource :dashboard, only: [:show], controller: 'pages', action: 'dashboard'

  # Ajout des routes pour les pages supplémentaires
  get 'favorites', to: 'pages#favorites'
  get 'infosperso', to: 'pages#infosperso'
  get 'myresults', to: 'pages#myresults'
end
