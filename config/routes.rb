Rails.application.routes.draw do
  resources :games

  resources :charges

  root to: 'games#index'
end
