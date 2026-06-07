class UrlCache < ApplicationRecord
  # include UrlCacheThumbUploader::Attachment(:thumb)
  has_one_attached :thumb

  def fresh?
    refreshed_at.present? && refreshed_at > 1.hour.ago
  end
end
