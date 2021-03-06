Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: %i[show]
  resources :events, only: %i[new create show index]
  put "events/:id", to: "events#register"
  root "events#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
