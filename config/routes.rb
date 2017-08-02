Rails.application.routes.draw do
  require 'resque/server'

  mount ActionCable.server => '/cable'

  get 'message/index'


  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  devise_scope :user do
  end
  get 'welcome/index'
  get '/api' => redirect('/swagger-ui/dist/index.html?url=/api/v1/api-docs.json')
  resource :users do
     get 'show', :on => :collection
     get 'index', :on => :collection

  end
  resources :chat
  post 'message/index' => 'message#index'
  post 'message/create' => 'message#create'

  mount Resque::Server.new, at: "/resque"
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
