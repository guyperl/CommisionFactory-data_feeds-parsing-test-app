CFDFT::Application.routes.draw do
  resources :data_feeds

  resources :merchants

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root 'data_feeds#index'

  resources :data_feeds do
    collection { post :search, to: 'data_feeds#index' }
  end
end
