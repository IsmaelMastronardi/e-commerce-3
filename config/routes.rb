Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do [ :show, :create]
        resources :orders do
          resources :order_products
        end
      end
      resources :language_codes do [ :index ]
      end
      resources :categories do [ :index, :show, :create, :update, :destroy]
      end
      resources :brands do [ :index, :show, :create, :update, :destroy]
      end
      resources :products do 
        resources :product_details
        resources :product_translations
      end
    end
  end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
