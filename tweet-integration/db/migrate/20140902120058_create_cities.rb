class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :GMT_Formula
      t.string :country
      t.float :lat
      t.float :long
      t.string :timezone
      t.float  :time_diff
      t.timestamps
    end
  end
end
