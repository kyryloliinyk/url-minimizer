# frozen_string_literal: true

# Responsible for creating short version of origin url
class CompressUrl
  extend Callable
  include Compressor

  def initialize(url)
    @url = url
  end

  def call
    raise ArgumentError unless url =~ URI::DEFAULT_PARSER.make_regexp

    parsed_url = URI.parse(url)
    scheme = parsed_url.scheme
    host = parsed_url.host
    short_host = encryptor.encrypt_and_sign(host)

    "#{scheme}://#{short_host}"
  end

  private

  attr_reader :url
end
