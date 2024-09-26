# frozen_string_literal: true

# Responsible for creating origin version of url from short version
class DecompressUrl
  extend Callable
  include Compressor

  def initialize(url)
    @url = url
  end

  def call
    raise ArgumentError unless url =~ URI::DEFAULT_PARSER.make_regexp

    parsed_url = URI.parse(url)
    scheme = parsed_url.scheme
    host = url.remove("#{scheme}://")

    original_host = encryptor.decrypt_and_verify(host)

    "#{scheme}://#{original_host}"
  end

  private

  attr_reader :url
end
