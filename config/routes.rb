Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/:resource/find', to: 'searches#show'
      get '/:resource/find_all', to: 'searches#index'
      # get '/items/find_all', to: 'items#index'
      # get '/items/find', to: 'items#show'
      resources :items do
        get '/merchant', to: 'merchants#show'
      end
      # get '/merchants/find_all', to: 'merchants#index'
      # get '/merchants/find', to: 'merchants#show'
      resources :merchants do
        resources :items, only: [:index]
      end
    end
  end
end