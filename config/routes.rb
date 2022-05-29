Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :authors
  get 'home/index'
  
  scope module: 'authors' do
    resources :posts
  end
  
  root to: "home#index"
end
