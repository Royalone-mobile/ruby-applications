require "constants"
class City < ActiveRecord::Base
	def self.import
		file_name="#{Rails.root}/public/cities-timezone-csv.csv"
		CSV.foreach(file_name, headers: true) do |row|
	    	create! row.to_hash
    	end
	end
	def self.update_time_diff
		cities=City.all 
		cities.each do |city|
			gmt=city.GMT_Formula
			a=gmt.split("")
			if a.length > 3
				time=a[4].to_f*10+a[5].to_f+((a[7].to_f*10+a[8].to_f)/60).to_f
				time=time * (-1) if a[3]=='-'
			else
				time=0
			end
			city.time_diff=time.to_f
			city.save
		end
	end
	def getMapUrl
		zoom='15'
		size='400x400'
		map_type='roadmap'
		marker_color='red'
		marker_size='small'
		marker_label='A'
		map_url="http://maps.googleapis.com/maps/api/staticmap?zoom=#{zoom}&size=#{size}&maptype=#{map_type}&markers=color:#{marker_color}|size:#{marker_size}|label:#{marker_label}|#{lat},#{long}"
	end
	def getImageUrl
		search_string="#{name} country beautiful".gsub(" ","%20")
	  	url="http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{search_string}"
	  	#p url
	  	r=RestClient.get url, :content_type => :json, :accept => :json
	  	json_resp=ActiveSupport::JSON.decode r
	  	resp=json_resp["responseData"]
		result=resp["results"]
		image_url=result.first["url"]
	end
	def short_url(long_url)
		response=RestClient.post "https://www.googleapis.com/urlshortener/v1/url", { 'longUrl' => long_url, 'key' => GOOGLE_API_KEY }.to_json, :content_type => :json, :accept => :json
		short_url_response=ActiveSupport::JSON.decode response
		short_url=short_url_response["id"]
	end
	def status
		long_url=getMapUrl
		url=short_url(long_url)
		#image_url=getImageUrl
		#Good morning, CITYNAME. GMAPS_URL.
		msg="Good morning, #{name} . #{url}"
	end
end