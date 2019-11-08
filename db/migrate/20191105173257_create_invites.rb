class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.string :date_time
      t.string :location
      t.string :status
      t.references :sender
      t.references :reciever

      t.timestamps
    end
    add_foreign_key :invites, :users, column: :sender_id
    add_foreign_key :invites, :users, column: :reciever_id
  end
end
