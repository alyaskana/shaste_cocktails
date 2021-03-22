Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, 
  defaults: { format: :json },
  path: '',
  path_names: {
    sign_in: 'api/login',
    sign_out: 'api/logout',
    registration: 'api/signup'
  },
  controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :ingredients
  resources :posts
  resources :cocktails
  resources :users do 
    member do
      get :posts
    end
  end
  resources :favorites

  resources :cocktails do
    resources :favorites
  end
  get 'cocktails/index'

  root 'cocktails#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
