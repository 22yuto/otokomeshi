Rails.application.routes.draw do

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
    resources :favorites, only:[:create, :destroy]
    resources :likes, only:[:create, :destroy]
    resources :orders
    get '/confirm' => 'recipes#confirm', as: 'confirms'
    patch '/confirm' => 'recipes#confirm_update', as: 'confirms_update'

  end

  get '/myfavorites' => 'favorites#index', as: 'myfavorites'
  get '/searchs' => 'recipes#search', as: 'searchs'
  get '/abouts' => 'recipes#about', as: 'about'
  get '/tag_index' => 'recipes#tag_index', as: 'tags'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
