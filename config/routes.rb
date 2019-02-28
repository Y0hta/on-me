Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, :controllers => {
    sessions: 'users/sessions', 
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'home#index'
  get '/', to: 'home#index'
  #get '/users/sign_in', to: 'home#index'
  #get '/users/sign_up', to: 'home#index'
  get '/terms', to: 'home#index'
  resources :users, only: [:show, :edit, :update]
  get '/dashboard', to: 'dashboard#index'
  get '/explore', to: 'explore#index'
  get '/settings', to: 'settings#edit', as: :edit_settings
  post '/settings/update', to: 'settings#update', as: :update_settings
  post '/stripe/disconnect', to: 'stripe#disconnect', as: :disconnect_stripe_account
  resources :charges, only: [:new, :create]
end
