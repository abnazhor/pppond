class UrlImagesFetcher
  def initialize(url)
    @url = url
  end

  def call
    object = LinkThumbnailer.generate(@url)
    object.images.map(&:src).uniq
  end
end
