Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home/index'

  get 'admin' => 'admin/home#index'
  namespace :admin do
    resources :pages
    resources :users
  end
end
