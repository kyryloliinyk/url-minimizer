# frozen_string_literal: true

module Resources
  module MinimizedUrl
    # Responsible for destroying MinimizedUrl entity
    class Destroy
      extend Callable

      def initialize(short_url)
        @short = short_url
      end

      def call
        ::MinimizedUrl.find_by!(short:).destroy
      end

      private

      attr_reader :short
    end
  end
end
