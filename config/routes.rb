Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new,:create,:edit,:show,:update]
  resources :posts do
    collection do
      post :confirm
    end
  end
end
