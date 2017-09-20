Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 # root "items#index"
 resources :items,  only: [:index, :show]
 resources :tags,   only: [:index, :show]
 resources :users,  only: [:new, :create]
 resources :orders, only: [:index, :show, :create]
 
 namespace :admin do
   resources :users, only: [:edit, :update]
   resources :tags
   resources :items
   resources :orders #we may take some routes out once it's more clear what we need.
 end

 get 'admin/dashboard' => 'admin/base#dashboard'
 get "/dashboard"      => "users#dashboard"
 get "/login"          => "sessions#new"
 post "/login"         => "sessions#create"
 delete "/logout"      => "sessions#destroy"
 get "/cart"           => "carts#show"
 post "/cart"          => "carts#create"
 patch "/cart"         => "carts#update"
 delete "/cart"        => "carts#destroy"
 get "/:name"          => "tags#show"
 
 get 'auth/:provider/callback', to: 'sessions#create'
 get 'auth/failure', to: redirect('/')
 get 'signout', to: 'sessions#destroy', as: 'signout'

 # resources :sessions, only: [:create, :destroy]
 # resource :home, only: [:show]

 root to: "sessions#new"
end
