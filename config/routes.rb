Quipper::Application.routes.draw do
  get 'auth/twitter/callback', to: 'sessions#create'

  root :to => 'home#index'
end
