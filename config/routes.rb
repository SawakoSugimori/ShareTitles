Rails.application.routes.draw do
  root to: 'pictures#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users
  resources :pictures, only: [:index, :new, :show, :create, :destroy]
  
  resources :titles, only: [:index, :create, :destroy]
  get 'users/:id/titles', to: 'users#user_titles' , as: 'user_titles'
  
  get 'users/:id/pictures', to: 'users#user_pictures', as: 'user_pictures'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
