Rails.application.routes.draw do

devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
devise_for :user, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  get 'homes/top'
  root to: 'homes#top'
  get "home/about"=>"homes#about"

  namespace :public do
    resources :recipes, only: [:index,:show,:new,:create,:destroy,] do
      resources :recipe_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:index,:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
    	get 'followings' => 'follows#followings', as: 'followings'
  	  get 'followers' => 'follows#followers', as: 'followers'
    end
  end

end
