Rails.application.routes.draw do
  root to: 'urls#index'

  resources :urls, only: [:create, :destroy]

  get '/:token', to: 'urls#show',
                 constraints: { token: /[0-9a-fA-F]{7,8}/ },
                 as: :shortened
end
