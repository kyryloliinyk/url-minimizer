# frozen_string_literal: true

module Api
  module V1
    # Controller to interact with MinimizedUrl entitties
    class MinimizedUrlsController < ApplicationController
      def show
        origin_url = Resources::MinimizedUrl::GetOriginFromShort.call(show_params)
        redirect_to origin_url, status: :moved_permanently, allow_other_host: true
      rescue ArgumentError
        head :bad_request
      end

      def create
        minized_url = Resources::MinimizedUrl::Create.call(create_params)
        render json: serialized(MinimizedUrlSerializer, minized_url), status: :ok
      rescue ArgumentError
        head :bad_request
      end

      def statistics
        statistcs = Resources::MinimizedUrl::GetStatistics.call(stat_limit)
        render json: statistcs, status: :ok
      end

      private

      def show_params
        request.url
      end

      def create_params
        params.require(:minimized_url).require(:origin)
      end

      def stat_limit
        params.permit(:limit)[:limit].to_i
      end
    end
  end
end
