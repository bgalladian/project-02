Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Good use of resources, root to, and devise to set up restful routes
  root to: "movies#index"
  resources :movies do
    resources :reviews do
      resources :comments
    end
  end
end
