class AddUserToCollections < ActiveRecord::Migration[8.1]
  def change
    add_reference :collections, :user, null: false, foreign_key: { to_table: :users }
  end
end
