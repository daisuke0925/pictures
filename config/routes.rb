Rails.application.routes.draw do

  get 'relationships/followings'
  get 'relationships/followers'
  root to: 'homes#top'

  devise_for :users

  get '/search', to: 'searchs#search'

  resources :users,only: [:show,:index,:edit,:update]

  resources :photos do
    resource :favorites, only: [:create, :destroy]
    resources :photo_comments, only: [:create, :destroy]
  end

  # ネストさせる
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
