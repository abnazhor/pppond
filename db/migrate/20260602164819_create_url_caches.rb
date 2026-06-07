class CreateUrlCaches < ActiveRecord::Migration[8.1]
  def change
    create_table :url_caches do |t|
      t.string :url, null: false
      t.string :title
      t.text :description
      t.json :thumb_data
      t.datetime :refreshed_at

      t.timestamps
    end
    add_index :url_caches, :url, unique: true
  end
end
