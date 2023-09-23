Rails.application.routes.draw do
  get 'api_details/show'
  apipie

  get "/", to: "api_details#show"

  namespace :api do
    namespace :v1 do
      resources :products, only: %i[index] do
        collection do
          put "/:code" => "products#update"
          delete "/:code" => "products#destroy"
          get "/:code" => "products#show"
        end
      end
    end
  end
end
