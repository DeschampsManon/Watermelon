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
        get 'change_columns_layout'
        get 'change_module'
        get 'add_section'
      end
    end
    resources :users do
      member do
        post 'update_password'
        get 'update_locale'
        get 'my_password'
      end
    end
    resources :pictures
    resources :posts
    resources :categories
  end
end
