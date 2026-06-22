class Post < ApplicationRecord
  include SearchCop

  has_many :pins, as: :pinable, dependent: :destroy
  has_many :collections, through: :pins
  belongs_to :collection, optional: true
  belongs_to :user

  # This is defined here only because Url has it yet we need it to be able to search by title in Post::Url.
  # This is a bit of a hack but it works for now.
  belongs_to :url_cache, optional: true

  search_scope :search do
    attributes title: "url_cache.title", url: "url_cache.url", user: "user.username"
    attributes :content
    attributes :title
  end

  # We have to mve that here to be able to join it on searches. Not ideal but it works for now.
  has_one_attached :screenshot do |attachable|
    attachable.variant :square_350, resize_to_fit: [ 350, 350 ], format: :jpg, saver: { quality: 80 }, preprocessed: true
  end

  after_commit :refresh_caches

  def refresh_pins_cards
    pins.find_each do |pin|
      broadcast_replace_later_to(pin, :card, targets: ".meta_pin_#{pin.id}", html: Components::Pins::Pin::Meta.new(pin: pin).call)
      broadcast_replace_later_to(pin, :card, targets: ".thumb_pin_#{pin.id}", html: Components::Pins::Pin::Thumb.new(pin: pin).call)
    end
  end

  private

  # @todo probably move that to a job?
  def refresh_caches
    pins.touch_all
    collections.touch_all
  end
end
