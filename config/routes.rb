Rails.application.routes.draw do
  get 'kadai_tasklists/create'

  get 'kadai_tasklists/destroy'

  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]

  resources :kadai_tasklists, only: [:create, :destroy]
end