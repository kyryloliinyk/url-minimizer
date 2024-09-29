# frozen_string_literal: true

module Api
  module V1
    module Admin
      # Controller to interact with MinimizedUrl entitties from admin panel
      class MinimizedUrlsController < ApplicationController
        include Pagy::Backend

        http_basic_authenticate_with name: admin_name, password: admin_password

        def index
          pagy, origin_urls = pagy(Resources::MinimizedUrl::GetAll.())
          render json: { origin_urls:, pagy: }, status: :ok
        end
  
        def create
          minized_url = Resources::MinimizedUrl::Admin::Create.(create_params)
          render json: serialized(AdminMinimizedUrlSerializer, minized_url), status: :created
        rescue ArgumentError
          head :bad_request
        end

        def update
          minimized_url = MinimizedUrl::Admin::Update.call(**update_params)
          render json: serialized(AdminMinimizedUrlSerializer, minimized_url), status: :ok
        end
  
        def destroy
          minimized_url = Resources::MinimizedUrl::Destroy.(**destroy_params)
        render json: serialized(AdminMinimizedUrlSerializer, minimized_url), status: :ok
        end
  
        private
  
        def destroy_params
          {
            short: params.require(:short),
            admin_pass: params.require(:minimized_url).require(:admin_pass)
          }
        end
  
        def create_params
          params.require(:minimized_url).require(:origin)
        end

        def update_params
          {
            short: params.require(:short)
            visits_count: params.require(:minimized_url).permit(:visits_count).to_h[:visits_count]
          }
        end

        def admin
          Rails.application.credentials.dig(:admin)
        end

        def admin_name
          admin[:username]
        end

        def admin_password
          admin[:password]
        end
      end
      
    end
  end
end
