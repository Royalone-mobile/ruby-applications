class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :trap_id
      t.timestamp :request_date
      t.string :remote_ip
      t.string :request_method
      t.string :scheme
      t.text :query_string
      t.text :query_params
      t.text :cookies
      t.text :headers
      t.text :original_fullpath
      t.text :request_method
      t.text :referer
      t.text :fullpath
      
      t.timestamps
    end
  end
end
