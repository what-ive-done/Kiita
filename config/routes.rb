Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :items do
      resources :comments
    end
  end

  get 'static_pages/home'
  get 'static_pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
end
