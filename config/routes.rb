Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    # post 'create', to: 'devise/registrations#create',as: 'user_registration'
  end
  get 'welcome/index'
  resources :users
  resources :chat
  # post 'create', to: 'users#create', as: 'users1'
  # get 'forgot-password', to: 'devise/passwords#new', as: 'forgot_password'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
