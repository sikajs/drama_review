Rails.application.routes.draw do
  devise_for :users
  resources :dramas do
    resources :comments, except: [:index, :show]
    collection do
      get 'search'
    end
  end

  root "dramas#index"
end
