Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items, only: [:show, :index, :create, :update, :destroy]
    end
  end
end