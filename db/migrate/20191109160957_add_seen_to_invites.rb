class AddSeenToInvites < ActiveRecord::Migration[6.0]
  def change
    add_column :invites, :seen, :boolean, default: false
  end
end
