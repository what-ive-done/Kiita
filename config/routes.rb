Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    get '/likes', to: 'users#likes'
    get '/comments', to: 'users#comments'
    get '/activities', to: 'users#activities'
    get '/settings', to: 'users#settings'
    resources :items do
      resources :comments
    end
  end

  resources :comments, only: [:destroy]

  get 'static_pages/home'
  get 'static_pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
end
