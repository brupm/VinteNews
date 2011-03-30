Vintenews::Application.routes.draw do
  match 'login' => 'user_sessions#new'
  match 'logout' => 'user_sessions#destroy'
  match 'register' => 'users#new'
  match 'about' => 'pages#about'
  match 'lists' => 'pages#lists'  

  resource :user_session
  resources :comments
  resources :posts
  match 'vote' => 'votes#create'
  
  resources :users do
    resources :posts
    resources :comments
  end

  resources :posts do
    resources :comments    
  end
  
  root :to => "posts#index"
end
