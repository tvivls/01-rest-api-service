Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]

  resources :programs, only: [:index, :show]
  get '/popular_programs', to: 'programs#search_popular_programs'

  resources :subscriptions, only: [:create, :new, :destroy]
  get '/subscriptions/user_programs/:user_id', to: 'subscriptions#user_programs'
end