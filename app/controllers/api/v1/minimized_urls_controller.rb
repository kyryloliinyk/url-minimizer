# frozen_string_literal: true

# Controller to interact with MinimizedUrl entitties
class MinimizedUrlsController < ApplicationController
  def show
    origin_url = resources::MiniimizedUrl::GetOriginFromShort.call(show_params)
    redirect_to origin_url, status: :moved_permanently
  rescue ArgumentError
    head :bad_request
  end

  def create
    minized_url = resources::MiniimizedUrl::Create.call(create_params)
    render json: serialized(MinimizedUrlSerializer, minized_url), status: :ok
  rescue ArgumentError
    head :bad_request
  end

  private

  def show_params
    params.require(:short)
  end

  def create_params
    params.require(:minimized_url).require(:origin)
  end
end
