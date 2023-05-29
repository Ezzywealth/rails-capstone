Rails.application.routes.draw do

    devise_for :users, views: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"

  resources :categories, only: [:index, :show, :new] do
    resources :operations, only: [:show, :new]
  end

end
