Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resource :registration, only: %i(new create)
  get "sign_up", to: "registrations#new"

  root to: "pages#home"
end
