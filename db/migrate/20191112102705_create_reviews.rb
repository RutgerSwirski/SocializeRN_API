class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :description
      t.references :reviewer
      t.references :reviewee
      t.timestamps
    end
    add_foreign_key :reviews, :users, column: :reviewer_id
    add_foreign_key :reviews, :users, column: :reviewee_id
  end
end
