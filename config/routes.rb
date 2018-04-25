Rails.application.routes.draw do

  get '/:username', to: 'users#show', as: 'users' do
    resources :items
  end

  devise_for :users
  get 'static_pages/home'
  get 'static_pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
end
