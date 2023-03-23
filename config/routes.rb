Rails.application.routes.draw do
  get 'likes/new'
  get 'likes/create'
  root 'users#index'

  get '/posts', to: 'posts#index'

  resources :users do
    resources :posts do
    end
  end

  post 'users/:user_id/posts/new' => 'posts#create', as: :post
  get 'users/:user_id/posts/comments/new' => 'comments#new', as: :comment 
  post 'users/:user_id/posts/comments/new' => 'comments#create', as: :post_comment
  get 'users/:user_id/posts/likes/new' => 'likes#new', as: :like 
  post 'users/:user_id/posts/likes/new' => 'likes#create', as: :post_like
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
