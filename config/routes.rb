Rails.application.routes.draw do

  get 'admin', to: 'admin#index', as: :admin
  get 'admin/promote/:id', to: 'admin#promote', as: :promote
  get 'admin/user_details/:id', to: 'admin#user_details', as: :user_details
  get 'admin/lock_user/:id', to: 'admin#lock_user', as: :admin_lock_user
  get 'admin/unlock_user/:id', to: 'admin#unlock_user', as: :admin_unlock_user

  resources :articles do
    member do
      put :clap
    end
  end


  resources :lists do
      resources :items do
        member do
          put :toggle
      end
    end
  end

  devise_for :users
  get 'welcome/index'
  get('profile', to: 'profiles#show', as: :profile)

  root to: "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
