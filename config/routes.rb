Rails.application.routes.draw do
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  push "/users" => "users#create"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#delete"
end
