class CreateAuthCodes < ActiveRecord::Migration[8.1]
  def change
    create_table :auth_codes do |t|
      t.string :code, null: false
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.datetime :expires_at, null: false

      t.timestamps
    end
    add_index :auth_codes, :code, unique: true
  end
end
