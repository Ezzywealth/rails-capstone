Rails.application.routes.draw do

  devise_for :users,views:{
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }, controllers: { sessions: 'users/sessions', }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"

  resources :categories do
    resources :operations
  end

end
