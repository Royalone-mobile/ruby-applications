class Business < ActiveRecord::Base
	has_many :reviews 
	has_many :categories, :through => :category_business, :source => :category
	
	def self.addData
		
	end

	
end
