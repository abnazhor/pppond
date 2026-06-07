class PinPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    !record.collection.private? || (user.present? && record.collection.user_id == user.id)
  end

  def create?
    user.present?
  end

  def update?
    user.present? && record.collection.user_id == user.id
  end

  def update_collection?
    user.present? && record.user_id == user.id
  end

  def destroy?
    user.present? && (record.user_id == user.id || record.collection.user_id == user.id)
  end
end
