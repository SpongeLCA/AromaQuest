Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :results, only: [:new, :create, :index, :show]
  resources :perfumes, only: [:index, :show] do
    resources :favorites, only: [:create, :destroy]
    resources :reviews, only: [:create]
  end

  resource :dashboard, only: [:show], controller: 'pages', action: 'dashboard' do
    get 'favorites', to: 'pages#favorites', as: :favorites
    get 'infos', to: 'pages#infos', as: :infos
    get 'results', to: 'pages#results', as: :results
  end
 end
