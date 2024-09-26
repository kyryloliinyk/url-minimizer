# frozen_string_literal: true

module Resources
  module MinimizedUrl
    # Responsible for retrieving MinimizedUrl visits statistcs
    class GetStatistics
      extend Callable

      def call
        ::MinimizedUrl.select(:short, :visits_count)
                      .order(visits_count: :desc)
                      .as_json(only: %i[short visits_count])
      end
    end
  end
end
