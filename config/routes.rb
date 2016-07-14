Rails.application.routes.draw do
  devise_for :users
  resources :dramas

  root "dramas#index"
end
