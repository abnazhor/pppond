class AddUserToPins < ActiveRecord::Migration[8.1]
  def change
    add_reference :pins, :user, null: true, foreign_key: { to_table: :users }
  end
end
