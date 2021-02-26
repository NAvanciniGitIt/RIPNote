Rails.application.routes.draw do

    #static routes
  root to: 'static#home'
  
  resources :posts 
  resources :dcds do 
    resources :posts, only: [:new, :create, :index, :show] do 
      resources :comments 
    end
  end #gives all the restful routes
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get '/sign_out', to: 'devise/sessions#destroy'
  get '/mine', to: 'dcds#mine'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
