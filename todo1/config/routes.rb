Rails.application.routes.draw do
  get 'sessions/new'
  get 'login', :to => 'sessions#new', :as => 'login'
  get 'logout', :to => 'sessions#destroy', :as => 'logout'
  post 'sessions', :to => 'sessions#create', :as => 'sessions'

  resources :users do
    resources :tasks do
      collection do
        get "unclosed"
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
