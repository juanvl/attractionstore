Rails.application.routes.draw do
  resources :sales
  resources :attractions
  resources :employees
  resources :companies
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
