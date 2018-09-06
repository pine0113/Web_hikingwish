Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :edit, :update]
  root "users#index"

  namespace :admin, path: :make_backend_url_abstruse do
    resources :plans
    root "plans#index"
  end
end
