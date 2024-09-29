# frozen_string_literal: true

module Resources
  module MinimizedUrl
    module Admin
      # Responsible for searching logic
      class Search
        extend Callable

        def initialize(term = nil)
          @term = term
        end

        def call
          ::MinimizedUrl.where('short ILIKE ?', "%#{term}%")
        end

        private

        attr_reader :term
      end
    end
  end
end
