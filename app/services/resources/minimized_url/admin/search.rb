# frozen_string_literal: true

module Resources
  module MinimizedUrl
    module Admin
      # Responsible for searching logic
      class Search
        extend Callable

        def initialize(search_term = nil)
          @search_term = search_term
        end

        def call
          ::MinimizedUrl.where('short ILIKE ?', "%#{search_term}%")
        end

        private

        attr_reader :search_term
      end
    end
  end
end
