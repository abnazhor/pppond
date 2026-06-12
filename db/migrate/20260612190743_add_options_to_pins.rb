class AddOptionsToPins < ActiveRecord::Migration[8.1]
  def change
    add_column :pins, :options, :json, default: {}
  end
end
