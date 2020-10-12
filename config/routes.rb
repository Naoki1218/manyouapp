Rails.application.routes.draw do
  root to: "tasks#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :tasks do
    collection do
      post :confirm
    end
  end
end
