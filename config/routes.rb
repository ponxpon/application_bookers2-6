Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users,only: [:show,:index,:edit,:update] do
    get :following, :followers
  end
  get "search" => "searches#search"
  post 'follow/:id' => 'relationships#create', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow' # フォロー外す
end