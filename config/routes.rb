Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root "items#index"
 resources :items
 resources :tags, only: [:index, :show]
 resources :users, only: [:new, :create]

 get "/dashboard" => "users#dashboard"
 get "/login" => "users#loginpage"
 delete "/login" => "users#logout"
 post "/login" => "users#login"
 get "/cart" => "carts#show"
 post "/cart" => "carts#create"
 patch "/cart" => "carts#update"
 delete "/cart" => "carts#destroy"
 get "/:name" => "tags#show"
end
