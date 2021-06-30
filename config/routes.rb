Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :events
  resources :users, only: [:show]
  resources :event_attendances, only: [:create]
  delete 'event-attendances', to: 'event_attendances#destroy',
         as: 'destroy_attendance'
end
