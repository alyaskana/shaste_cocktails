Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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

  namespace :api, defaults: {format: 'json'} do
    resources :cocktails, only: [:index, :show, :create] do
      collection do
        post :like
        post :unlike
        post :favorite
        post :unfavorite
        post :taste
        post :untaste
        get :search
      end
    end

    resources :tags, only: :index
    resources :ingredients, only: :index

    namespace :profile do
      resources :ingredients, only: [:index, :create] do
        collection do
          post :delete 
        end 
      end
      resources :favorites, only: [:index, :create, :destroy]
    end

    resources :users, only: [:show] do
      collection do
        post :follow
        post :unfollow
        get :profile
      end
    end

    resources :posts, only: [:index, :create]
  end
  
  # resources :ingredients
  # resources :posts
  # resources :cocktails
  # resources :users do 
  #   member do
  #     get :posts
  #   end
  # end
  # resources :favorites

  # resources :cocktails do
  #   resources :favorites
  # end
  # get 'cocktails/index'

  # root 'cocktails#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
