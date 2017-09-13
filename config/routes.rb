Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root "items#index"
 resources :items
 resources :tags, only: [:index, :show]

 get "/dashboard" => "users#dashboard"
 get "/login" => "users#loginpage"
 delete "/login" => "users#logout"
 post "/login" => "users#login"
 get "/:name" => "tags#show"
end
