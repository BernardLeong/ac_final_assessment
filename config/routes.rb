Rails.application.routes.draw do

  root "notes#index"

  devise_for :users, controllers: { registrations: 'users/registrations' } 
  
  resources :users do
    post 'follow', on: :member, to: 'follows#create'
    delete 'unfollow', on: :member, to: 'follows#destroy'
  end
  
  resources :notes do
    post 'like', on: :member, to: 'likes#create'
    delete 'unlike', on: :member, to: 'likes#destroy'
  end
end
