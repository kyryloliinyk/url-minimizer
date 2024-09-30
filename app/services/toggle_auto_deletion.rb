# frozen_string_literal: true

# Responsible for creating origin version of url from short version
class ToggleAutoDeletion
  extend Callable

  def call
    state = app_settings.auto_delete
    !state if app_settings.update(auto_delete: !state)
  end

  def app_settings
    @app_settings ||= AppSetting.last
  end
end
