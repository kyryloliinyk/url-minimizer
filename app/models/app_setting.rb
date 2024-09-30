# frozen_string_literal: true

# frozent_string_literal: true

# Application configs
class AppSetting < ApplicationRecord
  validates :id, uniqueness: true
  validate :single_entity

  private

  def single_entity
    errors.add(:base, 'Only one Settings record is allowed') if AppSetting.exists? && id.nil?
  end
end
