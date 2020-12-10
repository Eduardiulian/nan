Rails.application.routes.draw do
  resources :messages, except: :index
  resources :invites
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'automorphs#input'
  get 'automorphs/input'
  get 'automorphs/view'
  get 'automorphs/switch'
  get 'automorphs/cached', :defaults => { :format => 'xml' }
  get 'automorphs/userlist', :defaults => { :format => 'xml' }


  resources :users
  resources :sessions, only: [:new, :create, :destroy]  
  post 'invites/accept'
  get 'chats/chat'
  get 'chats/refresh'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'edit', to: 'users#edit', as: 'edit'
  get 'userspage', to: 'users#index', as: 'userspage'
  get 'invitelist', to: 'invites#send', as: 'invitelist'
  get 'chatlist', to: 'invites#chats', as: 'chatlist'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
