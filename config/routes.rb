# Rails.application.routes.draw do
#   get "up" => "rails/health#show", as: :rails_health_check

#   # Defines the root path route ("/")
#   root "posts#index"
# end
Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
