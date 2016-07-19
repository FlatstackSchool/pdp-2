Rails.application.routes.draw do
  devise_for :users

  resource :registration, only: %i(new create)
  get "sign_up", to: "registrations#new"

  root to: "pages#home"
end
