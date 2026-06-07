module UrlCaches
  class ThumbRefreshJob < ApplicationJob
    queue_as :default

    def perform(url_cache)
      UrlCaches::ThumbRefresher.new(url_cache).call
    end
  end
end
