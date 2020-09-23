# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: :create
      resources :people, only: %i[index create]
    end
  end
end
