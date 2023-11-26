Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :songs do
    resources :likes, only: [:create, :destroy]
  end
  resources :perfumes
  get 'sindanurl'=> 'perfumes#index'
  get 'myurl'=> 'users#show'
  get 'sinkiurl'=> 'songs#new'
  root 'songs#index'
end
