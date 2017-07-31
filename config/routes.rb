Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  get 'message/index'

  get 'message/Index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # devise_for :users
  devise_scope :user do
    # post 'create', to: 'devise/registrations#create',as: 'user_registration'
  end
  get 'welcome/index'
  resources :users
  resources :chat
  post 'message/index' => 'message#index'
  post 'message/create' => 'message#create'
  # get 'forgot-password', to: 'devise/passwords#new', as: 'forgot_password'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
