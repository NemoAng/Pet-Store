Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'#,
    #omniauth_callbacks: 'omni_auth'
  }
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'forgot_password', to: 'users/passwords#new'
    get 'reset_password', to: 'users/passwords#edit'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :categories
  get "/pages/:permalink" => "pages#permalink", as: "permalink"
  get "/pages/:cms_pages_about" => "pages#cms_pages_about", as: "cms_pages_about"

  resources :dog_breeds
  resources :cat_breeds
  # resources :pages
  resources :pages, except: [:show]

  # resources :birds, only: %i[index show]
  resources :birds, only: %i[index show] do
    collection do
      get "search"
    end
  end

  # resources :dogs, only: %i[index show]
  resources :dogs, only: %i[index show] do
    collection do
      get "search"
    end
  end

  # resources :cats, only: %i[index show]
  resources :cats, only: %i[index show] do
    collection do
      get "search"
    end
  end

  resources :cart, only: %i[create index destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "cats#index"

  # http://127.0.0.1:3000/           ?keywords=er&category=All&commit=Search
  # http://127.0.0.1:3000/     search?keywords=er&category=All&commit=Search
  # http://127.0.0.1:3000/cats/search?keywords=er&category=All&commit=Search
  # get "/search", to: "cats#index"
end
