Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq' if Rails.env.development?
  resources :jobs, only: %i[index create]
end
