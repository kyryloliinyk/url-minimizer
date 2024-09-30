# frozen_string_literal: true

module Api
  module V1
    module Admin
      # Controller to interact with MinimizedUrl entitties from admin panel
      class MinimizedUrlsController < ApplicationController
        include ActionController::HttpAuthentication::Basic::ControllerMethods
        include Pagy::Backend

        before_action :authenticate

        def index
          pagy, minimized_urls = pagy(Resources::MinimizedUrl::Admin::Search.(params[:search_term]))

          render json: {
            minimized_urls: serialized_collection(AdminMinimizedUrlSerializer, minimized_urls),
            pagination: pagination_data(pagy)
          }, status: :ok
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

        def statistics
          statistcs = Resources::MinimizedUrl::GetStatistics.()
          render json: statistcs, status: :ok
        end

        private

        def authenticate
          admin_creds = Rails.application.credentials[:admin]
          authenticate_or_request_with_http_basic do |username, password|
            username == admin_creds[:username] && password == admin_creds[:password]
          end
        end

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
            short: params.require(:short),
            visits_count: params.require(:minimized_url).permit(:visits_count).to_h[:visits_count]
          }
        end

        def pagination_data(pagy)
          {
            page: pagy.page,
            pages: pagy.pages,
            next: pagy.next,
            prev: pagy.prev
          }
        end
      end
    end
  end
end
