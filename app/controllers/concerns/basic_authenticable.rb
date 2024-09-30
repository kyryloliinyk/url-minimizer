# frozen_string_literal: true

# Provides basic authentication logic for controller
module BasicAuthenticable
  extend ActiveSupport::Concern
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  included do
    before_action :authenticate
  end

  private

  def authenticate
    admin_creds = Rails.application.credentials[:admin]
    authenticate_or_request_with_http_basic do |username, password|
      username == admin_creds[:username] && password == admin_creds[:password]
    end
  end
end
