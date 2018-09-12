Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'pages/about', :to => 'pages#about'
  
  resources :users, only: [:index, :show, :edit, :update]
  root "hikings#index"

  namespace :admin, path: :make_backend_url_abstruse do
    resources :plans
    resources :hikings
    root "hikings#index"
  end

  resources :hikings, only: [:index, :show] do
    member do
      get :plans
      get :wishes
    end
  end
  
  resources :wishes, only: [:index, :show, :edit, :update] do
    member do
      get :make_plan
      get :plan
    end
  end

  resources :plans, only: [:index, :show, :edit, :update] do
  end

  get 'search' => 'plans#search'
  get 'pages/index' => 'pages#index'
  get 'pages/plan_list' => 'pages#plan_list'
  get 'pages/plan_edit' => 'pages#plan_edit'

end
