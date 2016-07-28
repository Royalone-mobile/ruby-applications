class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      	t.string    :login,               :null => false            
    	t.string    :perishable_token    
		t.string	:provider
		t.string	:uid
		t.string	:name
		t.string	:nickname
		t.string    :oauth_token  ,  :null => false     , index: true
		t.string    :oauth_secret ,   :null => false   

      	t.timestamps
    end
  end
end
