Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
 root 'recipes#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :users do
    resource :relationships, only:[:create, :destroy]
    member do
      get :follows, :followers
    end
  end
    

  resources :recipes do
    resources :comments, only:[:create, :destroy]
    resources :favorites, only:[:create,:destroy]
    resources :orders
  end
  get '/myfavorites' => 'favorites#index', as: 'myfavorites'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
