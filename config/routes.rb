Rails.application.routes.draw do
  root to: 'urls#index'

  resources :urls, only: [:create, :destroy]

  get '/:token', to: 'urls#show',
                 constraints: { token: /[a-zA-Z0-9]{7}/ },
                 as: :shortened
end
