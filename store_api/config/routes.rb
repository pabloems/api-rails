Rails.application.routes.draw do

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  scope '(:locale)', locale: /es|en/ do
    get 'home/grettings'
    namespace :v1, defaults: { format: 'json' } do
      # Solo se habilita el método post
      resources :users, only: %i[create] do
        post 'login', on: :collection
        # gracias al :collection evitamos la siguiente ruta
        # users/:id/login
      end
      resources :stores, only: %i[show]
      resources :products, only: %i[index create update destroy] do
        # "v1/products/:product_id/restore"
        post 'restore'
      end
    end
  end
end
