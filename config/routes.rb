# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions',
                                    confirmations: 'users/confirmations',
                                    mailer: 'users/mailer',
                                    passwords: 'users/passwords',
                                    registrations: 'users/registrations',
                                    shared: 'users/shared' }
  root 'articles#index'
  get 'users', to: 'users#show'

  resources :articles do
    resources :comments
  end
end
