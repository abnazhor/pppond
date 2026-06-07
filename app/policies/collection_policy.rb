class CollectionPolicy < ApplicationPolicy
  def index?
    true
  end

  def inbox?
    true
  end

  def show?
    !record.private? || (user.present? && record.user_id == user.id)
  end

  def create?
    user.present?
  end

  def update?
    user.present? && record.user_id == user.id && !record.inbox?
  end

  def destroy?
    user.present? && record.user_id == user.id
  end
end
