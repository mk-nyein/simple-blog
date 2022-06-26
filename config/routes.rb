Rails.application.routes.draw do
  devise_for :authors

  get 'home/index'
  root to: "readers/home#index"
  get '/blog/:id' => 'readers/posts#show', as: :blog_post
  put '/blog/:id/like'    => 'readers/posts#upvote',   as: :blog_post_like
  put '/blog/:id/dislike' => 'readers/posts#downvote', as: :blog_post_dislike

  
  scope module: 'authors' do
    resources :posts do
      resources :elements
    end
  end
  
end
