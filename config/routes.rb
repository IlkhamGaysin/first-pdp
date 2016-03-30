Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  scope module: "users" do
    resources :articles, only: %i(show new create edit update)
    resources :comments, only: %i(create)
  end

  resources :articles, only: %i(index)
  resources :contacts, only: %i(new create)
end
