# frozen_string_literal: true

module Resources
  module MinimizedUrl
    # Incapsulates business logic of getting origin url from short version
    class GetOriginFromShort
      extend Callable

      def initialize(short_url)
        @short = short_url
      end

      def call
        DecompressUrl.call(short)
      end

      private

      attr_reader :short
    end
  end
end
