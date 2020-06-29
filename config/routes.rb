Rails.application.routes.draw do
  # トップページ
  root to: 'tops#index'

  # devise関連(shop_user)
  devise_for :shop_users, skip: :all

  devise_scope :shop_user do
    # get "shop_user/:id", :to => "shop_users/registrations#detail"
    # get "signup", :to => "shop_users/registrations#new"
    post "sign_up/confirm" => "shop_users/registrations#confirm", as: :confirm_shop_user_registration
    # get "login", :to => "shop_users/sessions#new"
    # get "logout", :to => "shop_users/sessions#destroy"

    get 'login' => 'shop_users/sessions#new', as: :new_shop_user_session
    post 'login' => 'shop_users/sessions#create', as: :shop_user_session
    delete 'logout' => 'shop_users/sessions#destroy', as: :destroy_shop_user_session
    get 'signup' => 'shop_users/registrations#new', as: :new_shop_user_registration
    post 'signup' => 'shop_users/registrations#create', as: :shop_user_registration
    get 'signup/cancel' => 'shop_users/registrations#cancel', as: :cancel_shop_user_registration
    get 'user' => 'shop_users/registrations#edit', as: :edit_shop_user_registration
    patch 'user' => 'shop_users/registrations#update', as: nil
    put 'user' => 'shop_users/registrations#update', as: :update_shop_user_registration
    delete 'user' => 'shop_users/registrations#destroy', as: :destroy_shop_user_registration
    get 'password' => 'shop_users/passwords#new', as: :new_shop_user_password
    post 'password' => 'shop_users/passwords#create', as: :shop_user_password
    get 'password/edit' => 'shop_users/passwords#edit', as: :edit_shop_user_password
    patch 'password' => 'shop_users/passwords#update'
    put 'password' => 'shop_users/passwords#update', as: :update_shop_user_password
  end
  resources :shop_users

  # store関連
  controller :stores do
    scope path: ':shop_user_id' do
      resources :stores
    end
  end
end
