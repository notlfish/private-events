Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :events, only: [:show, :create, :new, :edit, :update]
  resources :users, only: [:show]
  resources :event_attendances, only: [:create]
end
