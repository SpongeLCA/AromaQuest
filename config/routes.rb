Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :results, only: [:new, :create, :index, :show]
  resources :perfumes, only: [:index, :show] do
    resources :favorites, only: [:create, :destroy]
    resources :reviews, only: [:create]
  end

<<<<<<< HEAD
  resource :dashboard, only: [:show], controller: 'pages', action: 'dashboard' do
    get 'favorites', to: 'pages#favorites', as: :favorites
    get 'infos', to: 'pages#infos', as: :infos
    get 'results', to: 'pages#results', as: :results
  end
 end
=======
  resource :dashboard, only: [:show], controller: 'pages', action: 'dashboard'

  # Ajout des routes pour les pages supplémentaires
  get 'favorites', to: 'pages#favorites'
  get 'infosperso', to: 'pages#infosperso'
  get 'myresults', to: 'pages#myresults'
  get 'apropos', to: 'pages#apropos'
end
>>>>>>> 9e135dc5c6e089955276348d6574c40509d2e747
