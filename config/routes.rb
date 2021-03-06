# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: %i[new create]
  end
  root 'posts#index'
end
