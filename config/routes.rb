Rails.application.routes.draw do
  devise_for :users
  root "ideas#index"


  resources :ideas do
    resources :comments, only: [:create, :destroy]
  end

  resources :categories, only: [:show, :index]
end
