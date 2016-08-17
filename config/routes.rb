Rails.application.routes.draw do
  devise_for :users
  root "ideas#index"

  resources :ideas do
    collection do
      get :mine
    end
    resources :comments, only: [:create, :destroy]
    resources :votes, only: [:create, :update]
  end

  resources :categories, only: [:show, :index]
end
