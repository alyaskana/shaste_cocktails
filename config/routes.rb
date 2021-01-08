Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :ingredients
  resources :posts
  resources :cocktails
  resources :users
  resources :favorites

  resources :cocktails do
    resources :favorites
  end
  get 'cocktails/index'

  root 'cocktails#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
