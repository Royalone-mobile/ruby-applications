require 'twitter'
require 'open-uri'
class User < ActiveRecord::Base
	def self.create_twitter_user(auth)
		create! do |user|
		  	user.oauth_token=auth['credentials']['token']
		  	user.oauth_secret=auth['credentials']['secret']
		  	user.nickname=auth["info"]["nickname"]
		  	user.login=auth["info"]["name"]
		    user.provider = auth["provider"]
		    user.uid = auth["uid"]
		    user.name = auth["info"]["name"]
		end
	end
	def self.getRandomCity
		ids = City.pluck(:id).shuffle[0..0]
		city=City.find(ids.first)
	end
	def post_tweet
		city=User.getRandomCity
		client = Twitter::REST::Client.new do |config|
	    	config.consumer_key        = TWITTER_APP_ID
	      	config.consumer_secret     = TWITTER_SECRET
	      	config.access_token        = oauth_token
	      	config.access_token_secret = oauth_secret
    	end
	    uri = URI.parse(city.getImageUrl)
	    media = uri.open
	    media.instance_eval("def original_filename; '#{File.basename(uri.path)}'; end")
	    #p client.update(Time.now.to_s)
	    client.update_with_media(city.status, media)
	end
end
