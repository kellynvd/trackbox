# frozen_string_literal: true

Rails.application.routes.draw do
  resources :movements

  resources :personal_records do
    collection do
      resources(
        :movements,
        only: :index,
        module: :personal_records
      )
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
