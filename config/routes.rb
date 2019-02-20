Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, :controllers => {
    sessions: 'users/sessions', 
    registrations: 'users/registrations'
  }
  root to: 'home#index'
  get '/', to: 'home#index'
  #get '/users/sign_in', to: 'home#index'
  #get '/users/sign_up', to: 'home#index'
  get '/terms', to: 'home#index'
  resources :users, only: [:edit, :update]
  get '/dashboard', to: 'dashboard#index'
  get '/explore', to: 'explore#index'
  get '/settings', to: 'settings#edit', as: :edit_settings
  post '/settings/update', to: 'settings#update', as: :update_settings
end
