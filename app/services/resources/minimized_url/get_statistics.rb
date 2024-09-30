# frozen_string_literal: true

module Resources
  module MinimizedUrl
    # Responsible for retrieving MinimizedUrl visits statistcs
    class GetStatistics
      extend Callable

      def initialize(limit = nil)
        @limit = limit
      end

      def call
        ::MinimizedUrl.select(:short, :visits_count)
                      .order(visits_count: :desc)
                      .limit(limit)
                      .as_json(only: %i[short visits_count])
      end

      private

      attr_reader :limit
    end
  end
end
