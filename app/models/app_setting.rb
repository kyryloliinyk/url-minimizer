# frozen_string_literal: true

# frozent_string_literal: true

# Application configs
class AppSetting < ApplicationRecord
  validates :id, uniqueness: true
  validate :settings_uniqueness

  private

  def settings_uniqueness
    errors.add(:base, 'Only one Settings record is allowed') if AppSetting.count == 1
  end
end
