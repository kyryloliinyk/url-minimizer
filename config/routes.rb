Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :minimized_urls, only: %i[create show], param: :short
      get 'minimized_urls/statistics', to: 'minimized_urls#statistics'
        end
      end
end
