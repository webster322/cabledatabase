Rails.application.routes.draw do
  devise_for :users
  get 'fibres/index'

  get 'fibres/new'

  get 'fibres/delete'

  post 'fibres/create'

  get 'fibres/edit'

  get 'fibres/update'

  post 'fibres/search'

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

  get 'locale', to: 'locales#save_locale', as: :set_locale

  resources :locations

  resources :wires

  resources :fibres
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
