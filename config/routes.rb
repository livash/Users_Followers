UserFollow2::Application.routes.draw do
  resources :users, :except => :index
  resource :sessions
  resources :followings
  
  resources :users do
    resource :followings, only: [:create, :destroy]
  end
end
