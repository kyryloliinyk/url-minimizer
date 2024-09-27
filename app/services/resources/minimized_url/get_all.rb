# frozen_string_literal: true

module Resources
  module MinimizedUrl
    # Responsible for getting all MinimizedUrl entities logic for admin panel
    class GetAll
      extend Callable

      def call
        GetStatistics.()
      end
    end
  end
end
