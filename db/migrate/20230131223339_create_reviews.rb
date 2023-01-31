class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.integer :user_id
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
