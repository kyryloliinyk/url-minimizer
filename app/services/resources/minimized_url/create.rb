# frozen_string_literal: true

module Resources
  module MinimizedUrl
    # Responsible for MinimizedUrl entity creation
    class Create
      extend Callable

      def initialize(origin_url)
        @origin = origin_url
      end

      def call
        short = CompressUrl.call(origin)

        ::MinimizedUrl.create!(origin:, short:)
      end

      private

      attr_reader :origin
    end
  end
end
