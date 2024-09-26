# frozen_string_literal: true

# Responsible for creating short version of origin url
class CompressUrl
  extend Callable

  def initialize(url)
    @url = url
  end

  def call
    raise(ArgumentError, 'invalid url') unless url =~ URI::DEFAULT_PARSER.make_regexp

    parsed_url = URI.parse(url)
    scheme = parsed_url.scheme
    full_host = url.remove("#{scheme}://")
    short_host = Base64.urlsafe_encode64(full_host)

    "#{scheme}://#{short_host}"
  end

  private

  attr_reader :url
end
