class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :profile_picture_url
      t.string :first_name
      t.string :last_name
      t.string :description

      t.timestamps
    end
  end
end
