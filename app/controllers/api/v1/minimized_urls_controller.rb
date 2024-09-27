# frozen_string_literal: true

module Api
  module V1
    # Controller to interact with MinimizedUrl entitties
    class MinimizedUrlsController < ApplicationController
      def show
        origin_url = Resources::MinimizedUrl::GetOriginFromShort.(show_params)
        redirect_to origin_url, status: :moved_permanently, allow_other_host: true
      rescue ArgumentError
        head :bad_request
      end

      def create
        minized_url = Resources::MinimizedUrl::Create.(create_params)
        render json: serialized(MinimizedUrlSerializer, minized_url), status: :ok
      rescue ArgumentError
        head :bad_request
      end

      def statistics
        statistcs = Resources::MinimizedUrl::GetStatistics.()
        render json: statistcs, status: :ok
      end

      private

      def show_params
        request.url
      end

      def create_params
        params.require(:minimized_url).require(:origin)
      end
    end
  end
end
