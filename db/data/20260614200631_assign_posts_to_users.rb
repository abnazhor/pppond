# frozen_string_literal: true

class AssignPostsToUsers < ActiveRecord::Migration[8.1]
  def up
    Post.find_each do |post|
      post.update!(user_id: post.pins.first.user_id)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
