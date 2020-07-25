Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  resources :users, only: [:edit] do
    resources :credits, only: [:new, :create, :edit, :update, :destroy]
  end

  get 'users/:id/logout', to: 'users#logout'

  root 'items#index'
  resources :items do
    # Ajaxで動くアクションのルート
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :purchases, only: [:new, :create]
  end
  get 'get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
  get 'get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
end
