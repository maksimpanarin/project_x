Rails.application.routes.draw do
  root 'home#index'

  get '/users', to: 'users#index'
  get 'users/:id', to: 'users#show', constraints: { id: /[0-9]+/ }

  devise_for :users,
  path: '',
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }
end
