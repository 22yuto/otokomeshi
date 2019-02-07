Rails.application.routes.draw do

 root 'recipes#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :users

  resources :recipes do
    resources :favorites, only:[:create,:destroy]
    resources :orders
  end
  get '/myfavorites' => 'favorites#index', as: 'myfavorites'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
