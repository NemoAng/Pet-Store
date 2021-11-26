Rails.application.routes.draw do
  # resources :pages
  resources :pages, except: [:show]
  get "/pages/:permalink" => "pages#permalink", as: "permalink"

  get "/pages/:cms_pages_about" => "pages#cms_pages_about", as: "cms_pages_about"

  resources :dog_breeds
  resources :cat_breeds
  resources :birds
  resources :dogs
  resources :cats
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "cats#index"
end
