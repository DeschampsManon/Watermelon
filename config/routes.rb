Rails.application.routes.draw do
  devise_for :users
  root 'home#index'


  resources :home do
    get 'index'
    get 'show'
  end

  get 'users/my_profile'  => 'users#my_profile'
  get 'admin' => 'admin/home#index'
  namespace :admin do
    resources :pages
    resources :users
  end
end
