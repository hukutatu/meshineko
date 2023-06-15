Rails.application.routes.draw do

devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
devise_for :user, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  root to: 'homes#top'
  get "home/about"=>"homes#about"

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
    end
    get '/search', to: 'searches#search'
  end

end
