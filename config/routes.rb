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
    get 'confirm/:id' => 'users#confirm' , as: 'confirm_user'
    patch 'withdrawal/id' => 'users#withdrawal' ,as: 'withdrawl_user'
    resources :users, only:[:show, :edit, :update]
    resources :post_ideas, only: [:index, :edit, :new, :create, :show, :update, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
