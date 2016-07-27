Rails.application.routes.draw do
  devise_for :user

  devise_scope :user do
    resource :sessions, only: %i(create)

    get "sign_up", to: "registrations#new"
    get "sign_in", to: "sessions#new"
    get "sign_out", to: "sessions#destroy"
  end

  resource :registration, only: %i(new create)

  root to: "pages#home"
end
