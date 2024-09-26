# frozen_string_literal: true

# Controller to interact with MinimizedUrl entitties
class MinimizedUrlsController < ApplicationController
  def show; end

  def create
    minized_url = resources::MiniimizedUrl::Create.call(params.require(:origin))
    render json: serialized(MinimizedUrlSerializer, minized_url), status: :ok
  rescue ArgumentError
    head :bad_request
  end
end
