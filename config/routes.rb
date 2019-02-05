Rails.application.routes.draw do
 root 'recipes#index'
  get 'recipes/show'
  get 'recipes/edit'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
