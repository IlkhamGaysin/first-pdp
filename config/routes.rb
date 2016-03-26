Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  scope module: "users" do
    resources :articles, only: %i(new create edit update)
  end

  resources :articles, only: %i(index)
end
