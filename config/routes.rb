Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  root to: 'homes#top'

  devise_for :users

  get '/search', to: 'searches#search'

  resources :users, only: %i[show index edit update]

  resources :photos do
    resource :favorites, only: %i[create destroy]
    resources :photo_comments, only: %i[create destroy]
  end

  # ネストさせる
  resources :users do
    resource :relationships, only: %i[create destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
