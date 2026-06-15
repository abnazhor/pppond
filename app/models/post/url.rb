class Post::Url < Post
  belongs_to :url_cache, optional: true

  validates_url :url, presence: true, schemes: [ :http, :https ]

  has_one_attached :screenshot do |attachable|
    attachable.variant :square_350, resize_to_fit: [ 350, 350 ], format: :jpg, saver: { quality: 80 }, preprocessed: true
  end
end
