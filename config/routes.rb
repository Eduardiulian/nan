Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'automorphs#input'
  get 'automorphs/input'
  get 'automorphs/view'
  get 'automorphs/cached', :defaults => { :format => 'xml' }
  get 'automorphs/userlist', :defaults => { :format => 'xml' }


  resources :users
  resources :sessions, only: [:new, :create, :destroy]  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'edit', to: 'users#edit', as: 'edit'
  get 'userspage', to: 'users#index', as: 'userspage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
