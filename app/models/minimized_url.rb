# frozen_string_literal: true

# Represents shortened link entity with additional attrs
class MinimizedUrl < ApplicationRecord
  validates :origin, presence: true, uniqueness: { case_sensitive: false }
  validates :short, presence: true, uniqueness: { case_sensitive: false }
  validate :validate_urls

  private

  def validate_urls
    validate_url_format(:origin)
    validate_url_format(:short)
  end

  def validate_url_format(attribute)
    value = self[attribute]
    uri = URI.parse(value)
    errors.add(attribute, 'must be a valid URL') unless uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
  rescue URI::InvalidURIError
    errors.add(attribute, 'is not a valid URL')
  end
end
