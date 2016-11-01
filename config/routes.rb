Rails.application.routes.draw do
  devise_for :employers #, controllers: { registrations: "employers/registrations" }
  devise_for :users, controllers: { sessions: "devise/sessions", registrations: "devise/registrations" }

  root 'welcome#index'
  
  get 'my_page', to: "users#my_page"

  resources :posts
  resources :jobtypes, except: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
