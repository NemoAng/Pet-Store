Rails.application.routes.draw do
  resources :categories
  get "/pages/:permalink" => "pages#permalink", as: "permalink"
  get "/pages/:cms_pages_about" => "pages#cms_pages_about", as: "cms_pages_about"


  resources :dog_breeds
  resources :cat_breeds
  # resources :pages
  resources :pages, except: [:show]

  resources :birds, only: %i[index show]
  resources :dogs, only: %i[index show]
  resources :cats, only: %i[index show]

  resources :cart, only: %i[create index destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "cats#index"
end
