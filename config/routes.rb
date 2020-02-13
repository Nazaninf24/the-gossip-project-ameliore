Rails.application.routes.draw do

#ActiveAdmin.routes(self)

  get 'messages/index'
  get 'conversations/index'
  # get 'user/:user_id', to: 'user#show', as: 'user'

  # get 'gossip/:id', to: 'gossip#show', as:'gossip'
  root 'gossip#index'
   

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'team/', to: 'team#show'

  resources :sessions, only: [:new, :create, :destroy]
  
  resources :gossip do
    resources :comments
    # post 'gossip/:gossip_id/comment', to: 'comment#create', as: 'comment'
    
  end
  resources :welcome, only: [:show]

  resources :user

  resources :team, only: [:index]

  resources :contact, only: [:index]

  resources :city, only: [:show]

  resources :conversations, only: [:index, :create] do
  resources :messages, only: [:index, :create]
end






end
