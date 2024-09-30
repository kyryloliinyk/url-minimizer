# frozen_string_literal: true

# Responsible for unused urls autodeletion logic
class DeleteUnusedUrls
  extend Callable

  def call
    DeleteUnusedUrlsJob.perform
  end
end
