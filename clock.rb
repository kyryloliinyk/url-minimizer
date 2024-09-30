# frozen_string_literal: true

require 'clockwork'
require 'active_support/time'

# Scheduled tasks
module Clockwork
  every(2.months, 'miniized_urls.autodeletion') do
    DeleteUnusedUrls.call
  end
end
