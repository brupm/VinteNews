Vintenews::Application.routes.draw do
  get 'login' => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'
  get 'register' => 'users#new'
  get 'about' => 'pages#about'
  get 'lists' => 'pages#lists'

  resource :user_session
  resources :comments
  resources :posts
  get 'vote' => 'votes#create'

  resources :users do
    resources :posts
    resources :comments
  end

  resources :posts do
    resources :comments
  end

  root :to => "posts#index"
end
