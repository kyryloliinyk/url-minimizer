# frozen_string_literal: true

class DeleteUnusedUrls
  extend Callable

  def call
    MinimizedUrl.find_each do |url|
      url.destroy if url.visits_count.zero?
    end
  end
end
