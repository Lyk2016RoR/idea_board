Rails.application.routes.draw do
  root "ideas#index"
  get 'ideas/new', to: 'ideas#new'
  get 'ideas', to: 'ideas#index'
  get 'ideas/:id', to: 'ideas#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
