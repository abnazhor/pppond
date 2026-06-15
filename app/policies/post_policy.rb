class PostPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def connect?
    user.present?
  end

  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      @scope
    end
  end
end
