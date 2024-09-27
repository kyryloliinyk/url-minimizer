# frozen_string_literal: true

# Responsible for creating short version of origin url
class CompressUrl
  extend Callable
  include Rails.application.routes.url_helpers

  def initialize(url)
    @url = url
  end

  def call
    raise(ArgumentError, 'invalid url') unless url =~ URI::DEFAULT_PARSER.make_regexp

    encoded_url = Base64.urlsafe_encode64(url)

    "#{Rails.application.config.base_url}#{api_v1_minimized_urls_path}/#{encoded_url}"
  end

  private

  attr_reader :url
end
