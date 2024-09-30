Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      get 'minimized_urls/statistics', to: 'minimized_urls#statistics'
      resources :minimized_urls, only: %i[create show], param: :short
      namespace :admin do
        post 'setting/toggle-deletion', to: 'app_settings#toggle_deletion'
        get 'minimized_urls/statistics', to: 'minimized_urls#statistics'
        resources :minimized_urls, only: %i[index create update destroy], param: :short
      end
        end
      end
end
