class YelpSearchesController < ApplicationController

	def new_search
		@cat = Category.all

	end

	def search_yelp
		rating = params[:rating].to_i
		limit = params[:limit].to_i
		category = params[:category]
		date = params[:date]
		# binding.pry
		if rating == "Ratings"
			rating = ""
		end

		if category == "Category"
			category = ""
		end	

		if(date=='')
			@search_result = Business.all
		else
			@search_result = Business.joins("inner join reviews on reviews.business_id = businesses.id ").where("date(reviews.time_created)=?",date)			
		end

		return [] if @search_result.blank?
		
		if(rating != 0)
			@search_result = @search_result.where("rating = ? ",rating)
		end

		return [] if @search_result.blank?

		if(category!="")
			b_ids = @search_result.pluck(:id).uniq
			# binding.pry
			cat_bus=CategoryBusiness.where("business_id IN (?) and category_id = ? ",b_ids,category )
			# binding.pry
			@search_result =[]
			cat_bus.each do |cat|
				@search_result << cat.business
			end	
		end

		return [] if @search_result.blank?

		if(limit > 0)
			# binding.pry
			@search_result =  @search_result.first(limit)
			# binding.pry
		end     

		return [] if @search_result.blank?

		# if rating != "" && date =="" && category == ""
		# 	@search_result = Business.where(:rating=>rating)
		# elsif rating == "" && date == "" && category !=""
		# 	cat_bus=CategoryBusiness.where(:category_id=>category)
		# 	cat_bus.each do |cat|
		# 		@search_result = cat.business
		# 	end	
			

		# end

		# @search_result = Business.all
		
	end

	def display_reviews
		id=params[:id]
		@reviews = Review.where("business_id=?",id)
	end
	

end
