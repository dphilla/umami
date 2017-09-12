Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 resources :items
 resources :tags, only: [:index, :show]

 get "/:name" => "tags#show"
end
