Rails.application.routes.draw do
  resources :todos do
  	resources :comments
	end
  devise_for :users
  root 'todos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :todos, :only => [:show, :index]
    end
  end
end
