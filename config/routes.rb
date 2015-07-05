Rails.application.routes.draw do
  root to: 'sessions#new'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, except: [:new, :destroy, :edit, :update] do
    resources :tasks, except: [:index, :show]
  end
end
