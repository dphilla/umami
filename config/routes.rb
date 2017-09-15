Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root "items#index"
 resources :items
 resources :tags, only: [:index, :show]
 resources :users, only: [:new, :create]
 resources :orders, only: [:index, :show, :create]

 get "/dashboard" => "users#dashboard"
 get "/login" => "sessions#new"
 post "/login" => "sessions#create"
 delete "/logout" => "sessions#destroy"
 get "/cart" => "carts#show"
 post "/cart" => "carts#create"
 patch "/cart" => "carts#update"
 delete "/cart" => "carts#destroy"
 get "/:name" => "tags#show"
end
