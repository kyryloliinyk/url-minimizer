# frozen_string_literal: true

# Shared behaviour for minimizing url logic
module Compressor
  def encryptor
    @encryptor ||= ActiveSupport::MessageEncryptor.new(Rails.application.secret_key_base[0..31])
  end
end
