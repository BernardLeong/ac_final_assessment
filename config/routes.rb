Rails.application.routes.draw do
  devise_for :users 
  
  resources :followships, only: [:create, :destroy]

  resources :notes do 
    post 'like', on: :member, to: 'likes#create'
    delete 'unlike', on: :member, to: 'likes#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "notes#index"
end
