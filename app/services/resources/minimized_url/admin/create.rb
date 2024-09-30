# frozen_string_literal: true

module Resources
  module MinimizedUrl
    module Admin
      # Responsible for MinimizedUrl entity creation
      class Create
        extend Callable

        def initialize(origin_url)
          @origin = origin_url
        end

        def call
          short = CompressUrl.call(origin)
          admin_pass = Base64.encode64(origin)

          ::MinimizedUrl.create!(origin:, short:, admin_pass:)
        end

        private

        attr_reader :origin
      end
    end
  end
end
