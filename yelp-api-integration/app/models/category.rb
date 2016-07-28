class Category < ActiveRecord::Base
	validates :alias , :title , presence: true
	validates :alias , uniqueness: true
end
