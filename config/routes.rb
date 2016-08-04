Rails.application.routes.draw do
  devise_for :user

  devise_scope :user do
    resource :sessions, only: %i(create)

    get "sign_in", to: "sessions#new"
    get "sign_out", to: "sessions#destroy"
  end

  constraints ->(request) { Domain.new(request).main? } do
    get "sign_up", to: "registrations#new"

    resource :registration, only: %i(new create)
  end

  constraints ->(request) { Domain.new(request).subdomain? } do
    resource :company_registration, only: %i(new create)

    get "sign_up", to: "company_registrations#new"
  end

  root to: "pages#home"
end
