# frozen_string_literal: true

module Api
  module V1
    module Admin
      # Controller to interact with MinimizedUrl entitties from admin panel
      class AppSettingsController < ApplicationController
        include BasicAuthenticable

        def toggle_deletion
          if ToggleAutoDeletion.call
            head :ok
          else
            head :internal_server_error
          end
        end
      end
    end
  end
end
