# frozen_string_literal: true

# Responsible for creating origin version of url from short version
class DecompressUrl
  extend Callable

  def initialize(url)
    @url = url
  end

  def call
    raise ArgumentError unless url =~ URI::DEFAULT_PARSER.make_regexp

    parsed_url = URI.parse(url)
    scheme = parsed_url.scheme
    short_host = url.remove("#{scheme}://")
    original_host = Base64.decode64(short_host)

    "#{scheme}://#{original_host}"
  end

  private

  attr_reader :url
end
