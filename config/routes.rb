Quipper::Application.routes.draw do
  get 'auth/twitter/callback', to: 'sessions#create'
  resources :sessions #TODO: this should probably be a singleton
  resources :timelines, only: :show

  root :to => 'home#index'
end
