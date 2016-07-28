class TweetWorker
	@queue = :tweet_queue
  	def self.perform(user_id)
  		user=User.find(user_id)
		user.post_tweet
	end
end