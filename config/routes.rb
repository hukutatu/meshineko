Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :users
  get 'homes/top'
  root to: 'homes#top'
  
  namespace :pubilc do
    get 'follows/create'
    get 'follows/destroy'
    get 'follows/followings'
    get 'follows/followers'
  end
  namespace :pubilc do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :pubilc do
    get 'recipe_comments/new'
    get 'recipe_comments/create'
  end
  namespace :pubilc do
    get 'recipe/new'
    get 'recipe/create'
  end
 
end
