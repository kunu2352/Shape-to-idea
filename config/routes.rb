Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  passwords: 'public/passwords'
  }
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"}
  root to: 'public/homes#top'
  
  namespace :admin do
    get 'homes/top' => 'homes#top', as: :top
    resources :category, only: [:new, :create]
    
    
  end
  namespace :public do
    get 'confirm/:id' => 'users#confirm', as: 'confirm_user'
    patch 'withdrawal/id' => 'users#withdrawal', as: 'withdrawl_user'
    get 'purchased/:id' => 'users#purchased', as: 'purchased_user'
    get 'favorite_all' => 'users#favorite_all', as: 'favorite_all'
    get 'search' => 'searches#search', as: 'search'
    resources :users, only:[:show, :edit, :update]
    resources :post_ideas, only: [:index, :edit, :new, :create, :show, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :purchases, only: [:create]
    resources :category, only: [:show]
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
