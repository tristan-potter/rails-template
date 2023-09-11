Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?

  # Defines the root path route ("/")
  # root "articles#index"
end
