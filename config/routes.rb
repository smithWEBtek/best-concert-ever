Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'welcome#home'
  get '/about', to: 'welcome#about'

  get '/concerts/venue', to:'concerts#venue'

  resources :concerts

  resources :reviews, only: [:index]

  resources :users do
    resources :reviews
  end

# working on getting venues to display in the venues view


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
