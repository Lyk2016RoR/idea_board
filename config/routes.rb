Rails.application.routes.draw do
  root "ideas#index"
  get 'ideas/new', to: 'ideas#new'
  get 'ideas', to: 'ideas#index'
  get 'ideas/:id', to: 'ideas#show', as: "idea"
  post 'ideas', to: 'ideas#create'
end
