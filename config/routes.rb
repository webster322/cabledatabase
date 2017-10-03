Rails.application.routes.draw do
  get 'cable/new'

  get 'cable/edit'

  get 'cable/view'

  get 'cable/delete'

  get 'home/new'
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
