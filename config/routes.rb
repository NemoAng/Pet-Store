Rails.application.routes.draw do
  resources :pages
  resources :dog_breeds
  resources :cat_breeds
  resources :birds
  resources :dogs
  resources :cats
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "cats#index"
end
