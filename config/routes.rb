Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :authors
  get 'home/index'
  
  scope module: 'authors' do
    resources :posts do
      resources :elements
    end
  end
  
  root to: "readers/home#index"
end
