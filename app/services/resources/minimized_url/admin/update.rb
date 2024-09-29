# frozen_string_literal: true

module Resources
  module MinimizedUrl
    module Admin
      # Responsible for MinimizedUrl entity creation
      class Update
        extend Callable

        def initialize(short:, visits_count: nil)
          @short = short
          @visits_count = visits_count
        end

        def call
          return unless visits_count

          minimized_url = ::MinimizedUrl.find_by!(short:)

          return if visits_count == minimized_url.visits_count

          minimized_url if minimized_url.update!(visits_count:)
        end

        private

        attr_reader :short, :visits_count
      end
    end
  end
end
