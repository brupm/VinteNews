Vintenews::Application.routes.draw do
  match 'login' => 'user_sessions#new'
  match 'logout' => 'user_sessions#destroy'
  match 'register' => 'users#new'
  match 'about' => 'pages#about'

  resource :user_session
  resources :comments
  resources :posts

  resources :users do
    resources :posts
    resources :comments
  end

  root :to => "posts#index"
end
