Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'welcome#home'
  get '/about', to: 'welcome#about'

  get 'users/venue', to:'concert#venue'

  resources :concerts

  resources :reviews, only: [:index]

  resources :users do
    resources :reviews
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
