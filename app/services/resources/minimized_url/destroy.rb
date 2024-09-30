# frozen_string_literal: true

module Resources
  module MinimizedUrl
    # Responsible for destroying MinimizedUrl entity
    class Destroy
      extend Callable

      def initialize(short_url:, admin_pass:)
        @short = short_url
        @admin_pass = admin_pass
      end

      def call
        minimized_url = ::MinimizedUrl.find_by!(short:)
        raise(ArgumentError, 'invalid password') if minimized_url.admin_pass != admin_pass

        minimized_url.destroy
      end

      private

      attr_reader :short, :admin_pass
    end
  end
end
