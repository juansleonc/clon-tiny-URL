Rails.application.routes.draw do
  root 'urls#new'
  resources :urls, only: [:new, :create]
  get '/:token', to: 'urls#show', as: :short
  get '/:token/info', to: 'urls#info', as: :info
end
