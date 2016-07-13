Rails.application.routes.draw do
  resources :dramas

  root "dramas#index"
end
