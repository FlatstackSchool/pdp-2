Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resource :sign_up, only: %i(new create)
  get "sign_up", to: "sign_ups#new"

  root to: "pages#home"
end
