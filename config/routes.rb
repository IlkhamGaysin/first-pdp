Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"

  get "/about", to: "pages#about"

  scope module: "users" do
    resources :articles, only: %i(show new create edit update destroy)
    resources :comments, only: %i(create destroy)
  end

  resources :articles, only: %i(index)
  resources :contacts, only: %i(new create)
end
