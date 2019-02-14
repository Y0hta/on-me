Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}
  root to: 'home#index'
  get '/', to: 'home#index'
  get '/terms', to: 'home#terms'
end
