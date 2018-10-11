Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  
  post "/users(.:format)" => 'users#create', as: "users" do
    resource :password,
    controller: "clearance/passwords",
    only: [:create, :edit, :update]
  end
  
  post "/session(.:format)" => 'sessions#create', as: "session"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  
  resources :sales
  resources :attractions
  resources :employees
  resources :companies
  root 'attractions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
