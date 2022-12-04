Rails.application.routes.draw do
  resources :users, only: [:new,:create,:edit,:show,:update]
end
