Rails.application.routes.draw do

  resources :articles


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
