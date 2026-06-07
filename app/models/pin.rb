class Pin < ApplicationRecord
  belongs_to :pinable, polymorphic: true
  belongs_to :collection, counter_cache: true
  belongs_to :user

  delegated_type :pinable, types: %w[Post], dependent: :destroy

  accepts_nested_attributes_for :pinable

  scope :in_inbox, -> { where(collection_id: nil) }
  scope :newest_first, -> { order(created_at: :desc) }
end
