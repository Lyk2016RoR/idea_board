Rails.application.routes.draw do

  root "ideas#index"
  resources :ideas
  resources :categories, only: [:show, :index]
end
