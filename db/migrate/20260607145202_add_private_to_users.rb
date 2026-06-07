class AddPrivateToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :private, :boolean, default: true
  end
end
