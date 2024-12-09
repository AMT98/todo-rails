Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "sessions#new"

  #user signup
  get "signup", to: "users#new", as: :signup
  post "signup", to: "users#create"

  #Session login/logout
  get "login", to: "sessions#new", as: :login
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destory", as: :logout

  #Task routes
  resources :tasks
end
