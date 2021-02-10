Rails.application.routes.draw do

    #static routes
  root to: 'static#home'
  
  resources :comments
  resources :posts 
  resources :dcds do 
    resources :posts, only: [:new, :create, :index, :show]
  end #gives all the restful routes
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get '/signup', to: 'users#new'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
