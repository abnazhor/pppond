class Post::TextPolicy < PostPolicy
  def edit?
    user.present? && record.user_id == user.id
  end

  def update_text?
    edit?
  end
end
