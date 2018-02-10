Rails.application.routes.draw do
  resources :contacts
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  resources :blogs
  root to:'top#show'
  
  get 'blogs/new'
  resources :users, only: [:new,:create, :show]
  
  resources :top
  resources :favorites, only: [:create, :destroy]
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

