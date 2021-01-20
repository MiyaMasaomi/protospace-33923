Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :prototypes do
    resources :comments, only: :create
    #prototype_comments POST   /prototypes/:prototype_id/comments(.:format) comments#create
  end
  resources :users, only: :show
  #user GET    /users/:id(.:format) users#show
end
