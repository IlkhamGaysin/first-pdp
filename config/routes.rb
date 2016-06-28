Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"

  get "/about", to: "pages#about"

  scope module: "users" do
    resources :articles, only: %i(new create edit update destroy) do
      resources :comments, only: %i(create destroy)
    end
  end

  resources :articles, only: %i(index show)
  resources :contacts, only: %i(new create)
end
