CFDFT::Application.routes.draw do
  resources :data_feeds

  resources :merchants, only: [:index, :show]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :data_feeds do
    collection { post :search, to: 'data_feeds#index' }
  end

  root 'merchants#index'
end
