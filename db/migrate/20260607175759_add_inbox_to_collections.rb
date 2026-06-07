class AddInboxToCollections < ActiveRecord::Migration[8.1]
  def change
    add_column :collections, :inbox, :boolean, default: false, null: false
  end
end
