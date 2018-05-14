Rails.application.routes.draw do

  devise_for :users
  resources :posts do
    resources :comments
  end
  
  root "posts#index"

# Below, we don't want to have to go to /pages/about, we just want to go to /about
  get '/about', to: 'pages#about'

end
