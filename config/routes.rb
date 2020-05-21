Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :items do
        get :find, to: 'name_searches#show'
        get :find_all, to: 'name_searches#index'
      end
      resources :items, only: [:show, :index, :create, :update, :destroy] do
        get :merchant, to: 'merchants#show'
      end
      namespace :merchants do
        get :find, to: 'name_searches#show'
        get :find_all, to: 'name_searches#index'
        get :most_revenue, to: 'most_revenue#index'
        get :most_items, to: 'most_items#index'
      end
      resources :merchants, only: [:show, :index, :create, :update, :destroy] do
        resources :items, only: [:index]
      end
    end
  end
end