Rails.application.routes.draw do
  # devise_for :users
	devise_for :users, controllers: {
    	sessions: 'users/sessions',
    	registrations: 'users/registrations',
   	}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :static_pages
  root 'static_pages#index'
  
  mount ActionCable.server => '/cable'

  resources :chatrooms, param: :slug
  resources :messages
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
