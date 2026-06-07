class CreateCollections < ActiveRecord::Migration[8.1]
  def change
    create_table :collections do |t|
      t.string :name
      t.boolean :private, default: false
      t.integer :pins_count, default: 0

      t.timestamps
    end
  end
end
