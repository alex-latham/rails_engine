Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/:resource/find', to: 'searches#show'
      get '/:resource/find_all', to: 'searches#index'
      resources :items do
        get 'merchant', on: :member
        get '/merchant', to: 'items/merchants#show'
      end
      resources :merchants do
        resources :items, only: [:index]
      end
    end
  end
end