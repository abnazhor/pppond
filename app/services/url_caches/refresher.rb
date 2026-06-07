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

      return unless object.images.any?

      downloaded_image = URI.parse(object.images.first.src).open

      @url_cache.thumb.attach(
        io: downloaded_image,
        filename: File.basename(URI.parse(object.images.first.src).path)
      )

      @url_cache.touch(:refreshed_at)
    end
  end
end
