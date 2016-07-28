require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = '******************'
  config.consumer_secret = '*********************'
  config.token = '*********************'
  config.token_secret = '********************'
end