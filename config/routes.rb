Rails.application.routes.draw do
resources :users do
  resources :posts do
    resources :comments
  end
end
resources :posts, only: [:index, :show]

post 'user/:id/follow/:user_id', :to => 'users#add_follower'
end
