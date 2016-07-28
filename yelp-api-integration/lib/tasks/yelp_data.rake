namespace :yelp_data do

  desc "Collect data for City San Francisco"
  task :yelp => :environment do
  	begin
  		city = "San Francisco"
	   	puts "for #{city}"

	   	search_result = Yelp.client.search(city)
	   	categories = Category.all

	   	search_result.businesses.each do |records|
	   		business = Business.create!(name:records.name,phone:records.phone,rating:records.rating,address:records.location.display_address,yelp_id:records.id)
	   		puts "business created with #{business.id}"

	   		records.categories.each do |cat|
	   			categories.each do |bu_cat|
		   			if bu_cat.title == cat[0] && bu_cat.alias == cat[1]
		   				cat_bus = CategoryBusiness.create!(category_id: bu_cat.id,business_id:business.id)
		   				puts "cat business created with id #{cat_bus.id}"
		   			end
		   		end	
	   		end	

	   		reviews = Yelp.client.business(records.id)
	   		reviews.business.reviews.each do |ins_rev|
	   			time_created = Time.at(ins_rev.time_created)
	   			review = Review.create!(yelp_id:records.id,body:ins_rev.excerpt,time_created:time_created,user_id:ins_rev.user["id"],user_name:ins_rev.user["name"],user_photo_url:ins_rev.user["image_url"],business_id:business.id)
	   			puts "Reviews created #{review.id}"
	     	end  
	   	end	
  	rescue Exception => e
  		
  	end
  	

  end

  desc "Insert Categories in Category tables"
  task :category => :environment do
  	begin
  		file = File.read('public/categories.json')
			data_hash = JSON.parse(file)

			data_hash.each do |data|
				cat = Category.create!(alias:data["alias"],title:data["title"])
				puts "category inserted with #{cat.id}"
			end
			puts "All categories inserted."
  	rescue Exception => e
  		
  	end
  	
  end


end