Rails.application.routes.draw do
  get 'locations/index'

  get 'locations/create'

  get 'locations/delete'

  get 'locations/new'

  get 'wires/delete'

  get 'wires/new'

  get 'wires/edit'

  get 'wires/view'

  post 'wires/create'

  get 'home/index'
  root 'home#index'
  resources :locations
  resources :wires
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
