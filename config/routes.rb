Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"

  resources :categories, only: [:index, :show, :new] do
    resources :operations, only: [:show, :new]
  end

end
