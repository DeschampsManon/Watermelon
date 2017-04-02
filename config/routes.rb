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
    resources :pages do
      member do
        get 'preview'
      end
    end
    resources :users do
      member do
        post 'update_password'
        get 'update_locale'
        get 'my_password'
      end
    end
  end
end
