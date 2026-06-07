class Collection < ApplicationRecord
  has_many :pins, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validate :only_one_inbox_per_user, if: :inbox?

  scope :inbox, -> { where(inbox: true) }
  scope :regular, -> { where(inbox: false) }

  def self.find_inbox!
    find_by!(inbox: true)
  end

  def self.find_inbox
    find_by(inbox: true)
  end

  private

  def only_one_inbox_per_user
    if inbox? && user.collections.inbox.where.not(id: id).exists?
      errors.add(:inbox, "can only have one inbox collection per user")
    end
  end
end
