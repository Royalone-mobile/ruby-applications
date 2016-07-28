class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :phone
      t.integer :rating
      t.text :address
      t.string :yelp_id

      t.timestamps null: false
    end
  end
end
