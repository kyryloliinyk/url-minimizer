# frozen_string_literal: true

# Responsible for creating origin version of url from short version
class DecompressUrl
  extend Callable
  include Rails.application.routes.url_helpers

  def initialize(url)
    @url = url
  end

  def call
    raise ArgumentError unless url =~ URI::DEFAULT_PARSER.make_regexp

    Base64.decode64(compressed_url)
  end

  private

  attr_reader :url

  def compressed_url
    url
      .remove(Rails.application.config.base_url.to_s)
      .remove(api_v1_minimized_urls_path)[1..]
  end
end
