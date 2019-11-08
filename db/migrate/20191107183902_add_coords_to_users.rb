class AddCoordsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :longitude, :float, default: 0
    add_column :users, :latitude, :float, default: 0
  end
end
