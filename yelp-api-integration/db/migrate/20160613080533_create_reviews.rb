class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :yelp_id
      t.string :body
      t.datetime :time_created
      t.string :user_id
      t.string :user_name
      t.string :user_photo_url
      t.references :business, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
