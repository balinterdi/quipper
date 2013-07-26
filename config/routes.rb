Quipper::Application.routes.draw do
  get 'auth/twitter/callback', to: 'sessions#create'
  resources :timelines, only: :show

  root :to => 'home#index'
end
