Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, :controllers => {
    sessions: 'users/sessions', 
    registrations: 'users/registrations'
  }
  root to: 'home#index'
  get '/', to: 'home#index'
  #get '/*path', to: 'home#index'
end
