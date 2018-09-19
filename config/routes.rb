Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  
  root "pages#landing"

  resources :users, only: [:index, :show, :edit, :update] do
    member do
    end
  end
 

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
  
  resources :wishes do
    member do
      get :make_plan
      get :plan
      get :search
    end
  end

  resources :plans do
    member do
      get :prepare_team
      get :prepare
      get :invite_member
      get :search
      post :apply
      post :send_invite
    end
  end
  #get 'search' => 'plans#search'
  get 'all_plans' => 'plans#all'

  resources :cates, only: [] do
    member do
      get :list
    end
  end

  get 'cates/newbie' => 'cates#newbie'
  get 'cates/short' => 'cates#short'
  get 'cates/overnight' => 'cates#overnight'
  get 'cates/long' => 'cates#long'

  resources :plan_owner_invites, only: [:show] do
    member do
        post :approval
    end
  end

  resources :plan_member_applies, only: [:show] do
    member do
        post :approval
    end
  end

  resources :notifications, only: [:index]
  resources :tags, only: [:show]


  get 'pages/privacy' => 'pages#privacy'
  get 'pages/about', :to => 'pages#about'

  #get 'pages/index' => 'pages#index'
  #get 'pages/wish_edit' => 'pages#wish_edit'
  #get 'pages/wishes' => 'pages#wishes'
  #get 'pages/wishes_empty' => 'pages#wishes_empty'
  #get 'pages/plans_empty' => 'pages#plans_empty'

  get 'categories/index' => 'pages#index'

end
