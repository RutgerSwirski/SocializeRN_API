class AddCoordsToInvites < ActiveRecord::Migration[6.0]
  def change
    add_column :invites, :longitude, :float
    add_column :invites, :latitude, :float
  end
end
