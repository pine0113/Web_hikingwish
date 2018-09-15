Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'pages/about', :to => 'pages#about'
  
  resources :users, only: [:index, :show, :edit, :update]
  root "pages#landing"

  namespace :admin, path: :make_backend_url_abstruse do
    resources :plans
    resources :hikings
    root "hikings#index"
  end

  resources :hikings, only: [:index, :show] do
    member do
      get :plans
      get :wishes
      post :add_to_wish
    end
  end
  
  resources :wishes, only: [:index, :show, :edit, :update, :new, :create, :destroy] do
    member do
      get :make_plan
      get :plan
    end
  end

  resources :plans do
    member do
      get :prepare_team
      get :prepare
    end
  end

  resources :notifications, only: [:index]
  resources :tags, only: [:show]

  get 'all_plans' => 'plans#all'

  get 'search' => 'plans#search'

  get 'pages/index' => 'pages#index'
  get 'pages/wish_edit' => 'pages#wish_edit'
  get 'pages/wishes' => 'pages#wishes'
  get 'pages/wishes_empty' => 'pages#wishes_empty'
  get 'pages/plans_empty' => 'pages#plans_empty'

end
