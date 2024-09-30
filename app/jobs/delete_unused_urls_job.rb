# frozen_string_literal: true

# Performs unused urls deletion
class DeleteUnusedUrlsJob < ApplicationJob
  queue_as :default

  def perform
    MinimizedUrl.find_each do |url|
      url.destroy if url.visits_count.zero?
    end
  end
end
