Rails.application.routes.draw do
  root "pages#index"  
  
  resources :homes do
    resources :chores
    resources :users
  end

  get "/profile", to: "pages#profile"
  post "/homes/:id/add_user/:user_id", to: "homes#add_user", as: "add_user"
  post "/homes/:id/chores/assign_chores", to: "chores#assign", as: "assign_chores"
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
