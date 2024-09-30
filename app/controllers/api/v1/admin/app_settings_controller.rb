# frozen_string_literal: true

module Api
  module V1
    module Admin
      # Controller to interact with MinimizedUrl entitties from admin panel
      class AppSettingsController < ApplicationController
        include ActionController::HttpAuthentication::Basic::ControllerMethods

        before_action :authenticate

        def toggle_deletion
          if ToggleAutoDeletion.call
            head :ok
          else
            head :internal_server_error
          end
        end

        private

        def authenticate
          admin_creds = Rails.application.credentials[:admin]
          authenticate_or_request_with_http_basic do |username, password|
            username == admin_creds[:username] && password == admin_creds[:password]
          end
        end
      end
    end
  end
end
