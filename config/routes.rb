Rails.application.routes.draw do
  root "pages#index"  
  
  resources :homes do
    resources :chores
  end

  get "/profile", to: "pages#profile"
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
