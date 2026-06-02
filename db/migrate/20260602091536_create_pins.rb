class CreatePins < ActiveRecord::Migration[8.1]
  def change
    create_table :pins do |t|
      t.string :title
      t.string :url
      t.json :thumb_data
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
