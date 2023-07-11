Rails.application.routes.draw do

  get 'blogs/index'
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  devise_for :user, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root to: 'homes#top'
  get "home/about"=>"homes#about"

  namespace :admin do
   resources :users, only: [:index, :show, :edit, :update]
   root to: 'homes#top'
  end

  namespace :public do
    resources :recipes, only: [:index,:show,:new,:create,:destroy,:edit] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :recipe_comments, only: [:create, :destroy]
    resources :users, only: [:index,:show,:edit,:update] do
      get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
      patch 'users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
      resource :follows, only: [:create, :destroy]
    	get 'followings' => 'follows#followings', as: 'followings'
  	  get 'followers' => 'follows#followers', as: 'followers'
	    get 'recipes' => 'recipes#favorite_recipes', as: 'favorite_recipes'
    end
    get '/search', to: 'searches#search'
    resources :blogs, only: [:create, :show, :edit, :update, :destroy]
  end

end
