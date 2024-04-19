Rails.application.routes.draw do
  # namespace :admin do
  #   get 'users/index'
  #   get 'users/show'
  # end
  # namespace :admin do
  #   get 'post_ideas/show'
  # end
  
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  passwords: 'public/passwords'
  }
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"}
  
  root to: 'public/post_ideas#index'
  
  devise_scope :user do
    post 'users/gest_sign_user' => 'public/sessions#guest_sign_in'
    get "users" => redirect("/users/sign_up")
  end
  
  namespace :admin do
    # get 'homes/top' => 'homes#top', as: :top
    get 'post_ideas/purchase' => 'post_ideas/purchase', as: :purchase
    resources :post_comments, only: [:index, :destroy]
    resources :post_ideas, only: [:show, :index] do
    patch 'post_ideas/published' => 'post_ideas/published', as: :published
    patch 'post_ideas/unpublished' => 'post_ideas/unpublished', as: :unpublished
    end
    resources :searches, only: [:index] 
    resources :users, only: [:show]
    resources :category, only: [:new, :create, :destroy]
    resources :idea_requests, only: [:index, :show]
  end
  
  namespace :public do
    get 'confirm/:id' => 'users#confirm', as: 'confirm_user'
    patch 'withdrawal/id' => 'users#withdrawal', as: 'withdrawl_user'
    get 'search' => 'searches#search', as: 'search'
    
    resources :users, only:[:show, :edit, :update] do
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      get 'purchased/:id' => 'users#purchased', as: 'purchased_user'
      get 'favorite_all/:id' => 'users#favorite_all', as: 'favorite_all'
      resource :relationship, only:[:create, :destroy]
    end
    
    resources :post_ideas, only: [:index, :edit, :new, :create, :show, :update] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :purchases, only: [:create]
    resources :category, only: [:show]
    resources :idea_requests, only: [:index, :new, :create]
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
