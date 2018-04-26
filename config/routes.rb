Rails.application.routes.draw do
  get 'sessions/new'

  root to: "order_tables#index"
  resources :userrs
  resources :order_tables
  resources :food_predictions

  get    '/order_tables/new(.:format)',  to: 'order_tables#new'
  post    '/order_tables/new(.:format)',  to: 'order_tables#create'
  post    '/food_predictions/new(.:format)',  to: 'food_predictions#create'
  post    '/food_predictions/report(.:format)',  to: 'food_predictions#report'

  get    '/signup',  to: 'userrs#new'
  post   '/signup',  to: 'userrs#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
