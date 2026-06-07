module UrlCaches
  class Refresher
    def initialize(url_cache)
      @url_cache = url_cache
    end

    def call
      object = LinkThumbnailer.generate(@url_cache.url)

      @url_cache.update(
        title: object.title,
        description: object.description,
        refreshed_at: Time.current
      )

      UrlCaches::ThumbRefreshJob.perform_later(@url_cache)
    end
  end
end
