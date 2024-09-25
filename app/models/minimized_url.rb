# frozen_string_literal: true

# Represents shortened link entity with additional attrs
class MinimizedUrl < ApplicationRecord
  validates :origin, presence: true, uniqueness: true
  validate :origin_must_be_valid_url

  private

  def origin_must_be_valid_url
    uri = URI.parse(origin)
    unless uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
      errors.add(:origin, 'must be a valid HTTP or HTTPS URL')
    end
  rescue URI::InvalidURIError
    errors.add(:origin, 'is not a valid URL')
  end
end
