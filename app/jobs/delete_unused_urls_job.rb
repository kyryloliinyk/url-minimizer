class DeleteUnusedUrlsJob < ApplicationJob
  queue_as :default

  def perform()
    DeleteUnusedUrls.call()
  end
end
