# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :movements
  root to: 'users/sessions#new'

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
