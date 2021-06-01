Rails.application.routes.draw do
  # get 'rooms/index'
  # get 'rooms/new'
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/profile', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'users/profile', to: 'users/registrations#profile_update', as: 'profile_update'
    
  end

  root to: "home#index"
  get 'users/account'
  get 'rooms/posts'
  get 'rooms/search'
  resources :rooms

end
