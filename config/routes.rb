Rails.application.routes.draw do
  get 'locations/index'

  get 'locations/create'

  get 'locations/delete'

  get 'locations/new'

  get 'wires/delete'

  get 'wires/new'

  get 'wires/edit'

  get 'wires/view'

  get 'home/index'
  root 'home#index'
  resources :locations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
