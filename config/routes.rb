Rails.application.routes.draw do
  devise_for :users
  #devise_for :users, :controllers => {
  #  sessions: 'users/sessions', 
  #  registrations: 'users/registrations'
  #}
  root to: 'home#index'
  get '/', to: 'home#index'
  #get '/users/sign_in', to: 'home#index'
  #get '/users/sign_up', to: 'home#index'
  get '/terms', to: 'home#index'
  #post '/users', to: 'users/registrations#create'
  get '/dashboard', to: 'dashboard#index'
end
