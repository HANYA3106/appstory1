Rails.application.routes.draw do
  get 'categories/show'
  devise_for :users
  root 'stories#index'
  resources :stories do
    collection do
      get 'rank'
    end
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
  resources :categories, only: [:new, :create, :show]
  resources :subjects, only: [:new, :create]
  resources :purposes, only: [:new, :create]
  resources :tales, only: [:new, :create]
  resources :users, only: :show
end
