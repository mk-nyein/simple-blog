Rails.application.routes.draw do
  devise_for :authors

  root to: "readers/home#index"

  get 'home'  => 'readers/home#index', as: :home
  get 'members/:username' => 'readers/home#posts_of_member', as: :home_posts_of_member
  get '/blog/:id' => 'readers/posts#show', as: :blog_post
  put '/blog/:id/like'    => 'readers/posts#upvote',   as: :blog_post_like
  put '/blog/:id/dislike' => 'readers/posts#downvote', as: :blog_post_dislike

  
  scope module: 'authors' do
    resources :posts do
      resources :elements
    end
  end
  
end
