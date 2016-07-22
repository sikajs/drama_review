Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]

  get '/change_locale/:locale', to: 'users#change_locale', as: :change_locale

  resources :dramas do
    resources :comments, except: [:index, :show]
    collection do
      get 'search'
    end
  end

  root "dramas#index"
end
