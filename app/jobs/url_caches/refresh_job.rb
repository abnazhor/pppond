module UrlCaches
  class RefreshJob < ApplicationJob
    queue_as :default

    def perform(url_cache)
      UrlCaches::Refresher.new(url_cache).call
    end
  end
end
