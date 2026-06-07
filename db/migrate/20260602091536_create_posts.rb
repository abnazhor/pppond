class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.references :collection, null: true, foreign_key: { to_table: :collections }
      t.references :url_cache, null: true, foreign_key: { to_table: :url_caches }

      t.timestamps
    end
  end
end
