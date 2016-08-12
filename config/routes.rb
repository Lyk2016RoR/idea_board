Rails.application.routes.draw do
  root "ideas#index"
  resources :ideas
end
