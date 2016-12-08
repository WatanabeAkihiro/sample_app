Rails.application.routes.draw do
  post 'like/:micropost_id' => 'likes#like', as: 'like'
  delete 'unlike/:micropost_id' => 'likes#unlike', as: 'unlike'


  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get "/tweet" => "tweet#timeline"
  get "/signout_twitter" => "tweet#destroy"

  get "/auth/:provider/callback" => "tweet#create"

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy, :show]
  resources :relationships, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  end
