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
        increment_visits_count
        DecompressUrl.call(short)
      end

      private

      attr_reader :short

      def increment_visits_count
        minimized_url = ::MinimizedUrl.find_by!(short:)
        visits_count = minimized_url.visits_count
        minimized_url.update(visits_count: visits_count + 1)
      end
    end
  end
end
